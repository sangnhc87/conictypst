#!/usr/bin/env node

import { parseCliArgs, usage } from '../src/cli-args.mjs'
import { publishExam } from '../src/publisher.mjs'

try {
  const options = parseCliArgs(process.argv.slice(2))
  if (options.help) {
    process.stdout.write(`${usage()}\n`)
    process.exitCode = 0
  } else {
    const result = await publishExam(options)
    process.stdout.write(`${JSON.stringify({
      ok: true,
      outputDirectory: result.outputDirectory,
      packageFile: result.packageFile,
      questionCount: result.questionCount,
      maximumScore: result.maximumScore,
      embeddedBytes: result.embeddedBytes,
      backendPublicBytes: result.backendPublicBytes,
      warnings: result.warnings,
    }, null, 2)}\n`)
  }
} catch (error) {
  process.stderr.write(`Conic Exam Publisher: ${error?.message || error}\n`)
  if (process.env.CONIC_EXAM_DEBUG === '1' && error?.stack) {
    process.stderr.write(`${error.stack}\n`)
  }
  process.exitCode = 1
}
