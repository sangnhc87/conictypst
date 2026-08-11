import { spawn } from 'node:child_process';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const repositoryRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const wrangler = path.join(repositoryRoot, 'node_modules', '.bin', 'wrangler');
const concurrency = 4;
const productionRetention = 2;
const allowedProjects = new Set([
  'typstconichub',
  'hdsd-conictypst',
  'chamthi-conictypst',
  'thi-conictypst',
  'admin-conictypst',
  'conictypsst',
  'sang-math-store',
  'geo-conictypst',
  'beamer',
  'trinhchieu',
  'sang-math-graphics-studio',
]);

const rawArguments = process.argv.slice(2);
const dryRun = rawArguments.includes('--dry-run');
const requestedProjects = rawArguments.filter(argument => !argument.startsWith('--'));
const projects = rawArguments.includes('--all')
  ? [...allowedProjects]
  : requestedProjects;

if (!projects.length) {
  throw new Error(
    'Hãy truyền tên project hoặc --all. Ví dụ: npm run pages:prune -- chamthi-conictypst',
  );
}

for (const project of projects) {
  if (!allowedProjects.has(project)) {
    throw new Error(`Từ chối project ngoài danh sách an toàn: ${project}`);
  }
}

function runWrangler(argumentsList) {
  return new Promise((resolve, reject) => {
    const child = spawn(wrangler, argumentsList, {
      cwd: repositoryRoot,
      env: process.env,
      stdio: ['ignore', 'pipe', 'pipe'],
    });
    let stdout = '';
    let stderr = '';
    child.stdout.on('data', chunk => { stdout += chunk; });
    child.stderr.on('data', chunk => { stderr += chunk; });
    child.on('error', reject);
    child.on('close', code => {
      if (code === 0) resolve(stdout);
      else reject(new Error(`${stdout}\n${stderr}`.trim()));
    });
  });
}

async function listDeployments(project) {
  const output = await runWrangler([
    'pages',
    'deployment',
    'list',
    '--project-name',
    project,
    '--json',
  ]);
  return JSON.parse(output);
}

async function mapLimit(items, limit, task) {
  let cursor = 0;
  const workers = Array.from({ length: Math.min(limit, items.length) }, async () => {
    while (cursor < items.length) {
      const index = cursor++;
      await task(items[index]);
    }
  });
  await Promise.all(workers);
}

async function pruneProject(project) {
  const firstPage = await listDeployments(project);
  const productionDeployments = firstPage.filter(
    deployment => deployment.Environment === 'Production' && deployment.Branch === 'main',
  );

  if (!productionDeployments.length) {
    throw new Error(`Dừng an toàn: ${project} không có deployment Production/main để giữ`);
  }

  const keepIds = new Set(
    productionDeployments
      .slice(0, productionRetention)
      .map(deployment => deployment.Id),
  );
  let deleted = 0;

  if (dryRun) {
    const removable = firstPage.filter(deployment => !keepIds.has(deployment.Id));
    return {
      project,
      kept: [...keepIds],
      removableVisible: removable.length,
      dryRun: true,
    };
  }

  for (let round = 1; round <= 100; round++) {
    const deployments = await listDeployments(project);
    const visibleKeepIds = new Set(
      deployments
        .filter(deployment => keepIds.has(deployment.Id))
        .map(deployment => deployment.Id),
    );

    if (visibleKeepIds.size !== keepIds.size) {
      throw new Error(`Dừng an toàn: không còn thấy đủ deployment cần giữ của ${project}`);
    }
    const invalidKeep = deployments.some(
      deployment => (
        keepIds.has(deployment.Id) &&
        (deployment.Environment !== 'Production' || deployment.Branch !== 'main')
      ),
    );
    if (invalidKeep) {
      throw new Error(`Dừng an toàn: deployment cần giữ của ${project} đã đổi trạng thái`);
    }

    const removable = deployments.filter(deployment => !keepIds.has(deployment.Id));
    if (!removable.length) {
      return { project, kept: [...keepIds], deleted };
    }

    await mapLimit(removable, concurrency, async deployment => {
      await runWrangler([
        'pages',
        'deployment',
        'delete',
        deployment.Id,
        '--project-name',
        project,
        '--force',
      ]);
      deleted++;
    });
  }

  throw new Error(`Dừng an toàn: ${project} vượt quá 100 vòng dọn deployment`);
}

const results = [];
for (const project of projects) {
  const result = await pruneProject(project);
  results.push(result);
  console.log(JSON.stringify(result));
}

console.log(`Hoàn tất dọn deployment cho ${results.length} project.`);
