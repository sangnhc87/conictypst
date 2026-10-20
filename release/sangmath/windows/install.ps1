# Đăng ký add-in Sang Math với Word (không cần quyền quản trị). Gọi bởi SangMath-Setup.exe.
$ErrorActionPreference = 'Stop'
$base = 'https://sangmath-word.pages.dev'
$id   = '1392035f-25bf-4817-81b9-523377b1695e'
$dir  = Join-Path $env:LOCALAPPDATA 'SangMath'
$file = Join-Path $dir 'manifest.xml'
$key  = 'HKCU:\Software\Microsoft\Office\16.0\WEF\Developer'
New-Item -ItemType Directory -Force -Path $dir | Out-Null
Invoke-WebRequest -Uri "$base/manifest.xml" -OutFile $file -UseBasicParsing
if (-not (Select-String -Path $file -Pattern '<OfficeApp' -Quiet)) { Remove-Item $file -Force; throw 'Không tải được manifest Sang Math. Kiểm tra mạng rồi cài lại.' }
New-Item -Path $key -Force | Out-Null
New-ItemProperty -Path $key -Name $id -Value $file -PropertyType String -Force | Out-Null
