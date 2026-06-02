import json
import os

subagents = {
    "Lần 4": "a9f96610-373f-40a2-bfa9-a89cbf343ff7",
    "Lần 5": "d9a93480-e578-48e8-9e27-fb51ad036df9",
    "Lần 6": "9ce10d14-8cc7-4579-87b7-222b65672926",
    "Lần 7": "68a93fe6-0fc2-44c8-a4a4-bf4d1c5fa9bb",
    "Lần 8": "98a15fbd-6d91-4fd4-a63d-34738c9bb6d9",
    "Lần 9": "9504dec3-fec0-4021-92ac-bff2a8f13f45",
    "Lần 10": "fb83b0e9-c8ca-42f5-92b6-a09980a5bb30"
}

for name, cid in subagents.items():
    print(f"\n==================== {name} ({cid}) ====================")
    log_path = f"/Users/admin/.gemini/antigravity/brain/{cid}/.system_generated/logs/transcript.jsonl"
    if not os.path.exists(log_path):
        print("Log file does not exist yet (subagent has not executed any step).")
        continue
    
    with open(log_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        
    print(f"Total steps: {len(lines)}")
    errors = []
    last_steps = lines[-5:] if len(lines) >= 5 else lines
    
    for idx, line in enumerate(lines):
        try:
            data = json.loads(line)
            if data.get('type') == 'ERROR_MESSAGE' or 'error' in str(data).lower():
                errors.append((idx + 1, data.get('error', 'unknown error')[:200]))
        except Exception as e:
            pass
            
    if errors:
        print(f"Errors detected ({len(errors)}):")
        for step_num, err in errors[-5:]:
            print(f"  Step {step_num}: {err}")
    else:
        print("No errors detected.")
        
    print("Last 3 steps:")
    for line in lines[-3:]:
        try:
            data = json.loads(line)
            print(f"  Step {data.get('step_index')}: type={data.get('type')} source={data.get('source')} status={data.get('status')}")
            content = data.get('content', '')
            if content:
                print(f"    Content: {content[:150]}...")
        except Exception as e:
            print(f"  Failed to parse: {e}")
