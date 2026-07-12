import os
import glob

html_files = glob.glob('/Users/admin/conictypst/public/hdsd/*.html')
js_files = glob.glob('/Users/admin/conictypst/public/hdsd/*.js')
for fpath in html_files + js_files:
    with open(fpath, 'r') as f:
        content = f.read()
    
    # Simple replacements
    content = content.replace('Typst WASM Compiler đang khởi tạo.', 'Hiệu ứng đang biên dịch đẹp đẳng cấp đang khởi tạo.')
    content = content.replace('Đang khởi tạo và biên dịch Typst WASM...', 'Đang khởi tạo hiệu ứng đang biên dịch đẹp đẳng cấp...')
    content = content.replace('Đang chạy Typst WASM compiler...', 'Đang chạy hiệu ứng đang biên dịch đẹp đẳng cấp...')
    content = content.replace('Preview thật bằng Typst WASM', 'Preview thật bằng hiệu ứng đang biên dịch đẹp đẳng cấp')
    content = content.replace('Typst Compiled Image (WASM)', 'Typst Compiled Image (hiệu ứng đang biên dịch đẹp đẳng cấp)')
    content = content.replace('Preview Typst WASM', 'Preview bằng hiệu ứng đang biên dịch đẹp đẳng cấp')
    content = content.replace('WASM', 'hiệu ứng đang biên dịch đẹp đẳng cấp')
    content = content.replace('hiệu ứng đang biên dịch đẹp đẳng cấp-panel', 'wasm-panel')
    content = content.replace('hiệu ứng đang biên dịch đẹp đẳng cấp-code', 'wasm-code')
    content = content.replace('hiệu ứng đang biên dịch đẹp đẳng cấp-preview', 'wasm-preview')
    content = content.replace('hiệu ứng đang biên dịch đẹp đẳng cấp-actions', 'wasm-actions')
    content = content.replace('hiệu ứng đang biên dịch đẹp đẳng cấpTitle', 'wasmTitle')
    content = content.replace('hiệu ứng đang biên dịch đẹp đẳng cấpPreview', 'wasmPreview')
    content = content.replace('COMPILER_hiệu ứng đang biên dịch đẹp đẳng cấp', 'COMPILER_WASM')
    content = content.replace('RENDERER_hiệu ứng đang biên dịch đẹp đẳng cấp', 'RENDERER_WASM')
    content = content.replace('.hiệu ứng đang biên dịch đẹp đẳng cấp', '.wasm')
    content = content.replace('hiệu ứng đang biên dịch đẹp đẳng cấpUrl', 'wasmUrl')
    content = content.replace('hiệu ứng đang biên dịch đẹp đẳng cấpModule', 'wasmModule')
    content = content.replace('inithiệu ứng đang biên dịch đẹp đẳng cấp', 'initWasm')
    
    with open(fpath, 'w') as f:
        f.write(content)
