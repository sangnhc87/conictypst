import os, sys, json, base64, subprocess
import urllib.request
import urllib.parse

def run_gh(cmd):
    return subprocess.check_output(["gh"] + cmd).decode('utf-8').strip()

# Fork the repo if not already
print("Checking fork...")
try:
    fork = run_gh(["repo", "view", "sangnhc87/packages", "--json", "name"])
except:
    print("Forking typst/packages...")
    run_gh(["repo", "fork", "typst/packages", "--clone=false"])

# Get default branch of upstream
print("Getting upstream main SHA...")
upstream_sha = run_gh(["api", "repos/typst/packages/git/refs/heads/main", "--jq", ".object.sha"])

# Create branch on fork
print("Creating branch...")
branch_name = "sang-math-1.0.0"
try:
    run_gh(["api", "-X", "POST", "repos/sangnhc87/packages/git/refs", "-F", f"ref=refs/heads/{branch_name}", "-F", f"sha={upstream_sha}"])
except Exception as e:
    print("Branch might already exist or error, continuing...")

# Upload files
print("Creating tree...")
files = [
    "bbt.typ", "geometry.typ", "lib.typ", "math-sym.typ", 
    "sang-exam.typ", "typst.toml", "sang-beamer.typ", "sang-book.typ"
]
tree = []
for f in files:
    path = os.path.join("/Users/admin/conictypst/typst-pkg-submit", f)
    with open(path, "rb") as file:
        content = file.read()
    content_b64 = base64.b64encode(content).decode('utf-8')
    # Create blob
    blob = json.loads(run_gh(["api", "-X", "POST", "repos/sangnhc87/packages/git/blobs", "-f", f"content={content_b64}", "-f", "encoding=base64"]))
    tree.append({
        "path": f"packages/preview/sang-math/1.0.0/{f}",
        "mode": "100644",
        "type": "blob",
        "sha": blob['sha']
    })

# Create Tree
print("Submitting tree...")
tree_payload = json.dumps({"base_tree": upstream_sha, "tree": tree})
with open("tree.json", "w") as f:
    f.write(tree_payload)
new_tree = json.loads(run_gh(["api", "-X", "POST", "repos/sangnhc87/packages/git/trees", "--input", "tree.json"]))
os.remove("tree.json")

# Create Commit
print("Creating commit...")
commit_payload = json.dumps({"message": "Add sang-math 1.0.0 package", "tree": new_tree['sha'], "parents": [upstream_sha]})
with open("commit.json", "w") as f:
    f.write(commit_payload)
new_commit = json.loads(run_gh(["api", "-X", "POST", "repos/sangnhc87/packages/git/commits", "--input", "commit.json"]))
os.remove("commit.json")

# Update Ref
print("Updating branch ref...")
run_gh(["api", "-X", "PATCH", f"repos/sangnhc87/packages/git/refs/heads/{branch_name}", "-f", f"sha={new_commit['sha']}", "-F", "force=true"])

# Create PR
print("Creating PR...")
try:
    pr = run_gh(["api", "-X", "POST", "repos/typst/packages/pulls", 
                "-f", "title=Add sang-math 1.0.0", 
                "-f", "body=Conictypst's comprehensive math macros for Vietnamese High School Mathematics.",
                "-f", f"head=sangnhc87:{branch_name}", 
                "-f", "base=main"])
    pr_url = json.loads(pr)['html_url']
    print(f"PR Created Successfully: {pr_url}")
except Exception as e:
    print(f"Failed to create PR (maybe it already exists?): {e}")

