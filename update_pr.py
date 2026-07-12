import os, sys, json, base64, subprocess

def run_gh(cmd):
    return subprocess.check_output(["gh"] + cmd).decode('utf-8').strip()

upstream_sha = run_gh(["api", "repos/typst/packages/git/refs/heads/main", "--jq", ".object.sha"])
branch_name = "sang-math-1.0.0"
pkg_dir = "/Users/admin/conictypst/typst-pkg-sang-math"

print("Creating tree...")
tree = []
for root, dirs, files in os.walk(pkg_dir):
    for f in files:
        if f.startswith('.'): continue
        path = os.path.join(root, f)
        rel_path = os.path.relpath(path, pkg_dir)
        if rel_path.startswith("tests/") or rel_path.startswith("examples/") or rel_path.startswith("docs/") or rel_path.endswith(".sh"):
            continue
        
        with open(path, "rb") as file:
            content = file.read()
        content_b64 = base64.b64encode(content).decode('utf-8')
        try:
            blob = json.loads(run_gh(["api", "-X", "POST", "repos/sangnhc87/packages/git/blobs", "-f", f"content={content_b64}", "-f", "encoding=base64"]))
            tree.append({
                "path": f"packages/preview/sang-math/1.0.0/{rel_path}",
                "mode": "100644",
                "type": "blob",
                "sha": blob['sha']
            })
            print(f"Uploaded {rel_path}")
        except Exception as e:
            print(f"Failed to upload {rel_path}: {e}")

print("Submitting tree...")
tree_payload = json.dumps({"base_tree": upstream_sha, "tree": tree})
with open("tree.json", "w") as f:
    f.write(tree_payload)
new_tree = json.loads(run_gh(["api", "-X", "POST", "repos/sangnhc87/packages/git/trees", "--input", "tree.json"]))
os.remove("tree.json")

print("Creating commit...")
commit_payload = json.dumps({"message": "Add exam and book templates to sang-math 1.0.0", "tree": new_tree['sha'], "parents": [upstream_sha]})
with open("commit.json", "w") as f:
    f.write(commit_payload)
new_commit = json.loads(run_gh(["api", "-X", "POST", "repos/sangnhc87/packages/git/commits", "--input", "commit.json"]))
os.remove("commit.json")

print("Updating branch ref...")
run_gh(["api", "-X", "PATCH", f"repos/sangnhc87/packages/git/refs/heads/{branch_name}", "-f", f"sha={new_commit['sha']}", "-F", "force=true"])
print("Successfully updated PR branch!")
