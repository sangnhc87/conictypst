# Cai Sang Math cho Word Windows: tai manifest roi dang ky voi Word (khong can quyen quan tri).
# Dung:  powershell -NoProfile -ExecutionPolicy Bypass -Command "iwr https://sangmath-word.pages.dev/install-windows.ps1 -UseBasicParsing | iex"
# Go:    dat bien SM_REMOVE=1 truoc khi chay lenh tren.
$ErrorActionPreference = 'Stop'
$base = if ($env:SM_BASE_URL) { $env:SM_BASE_URL } else { 'https://sangmath-word.pages.dev' }
$id   = '1392035f-25bf-4817-81b9-523377b1695e'
$dir  = Join-Path $env:LOCALAPPDATA 'SangMath'
$file = Join-Path $dir 'manifest.xml'
$key  = 'HKCU:\Software\Microsoft\Office\16.0\WEF\Developer'

if ($env:SM_REMOVE -eq '1') {
  Remove-ItemProperty -Path $key -Name $id -ErrorAction SilentlyContinue
  Remove-Item -Path $dir -Recurse -Force -ErrorAction SilentlyContinue
  Write-Host 'Da go Sang Math. Mo lai Word de cap nhat.'
  return
}

New-Item -ItemType Directory -Force -Path $dir | Out-Null
Invoke-WebRequest -Uri "$base/manifest.xml" -OutFile $file -UseBasicParsing
if (-not (Select-String -Path $file -Pattern '<OfficeApp' -Quiet)) {
  Remove-Item $file -Force
  throw 'Tep tai ve khong phai manifest cua Sang Math. Kiem tra mang roi thu lai.'
}
New-Item -Path $key -Force | Out-Null
New-ItemProperty -Path $key -Name $id -Value $file -PropertyType String -Force | Out-Null

Write-Host "Da cai Sang Math: $file"
Write-Host ''
Write-Host 'Buoc tiep theo:'
Write-Host '  1. Thoat han Word roi mo lai.'
Write-Host '  2. Insert (Chen) > My Add-ins (Phan bo tro cua toi) > Developer Add-ins > Sang Math.'
Write-Host 'Cong cu tu cap nhat: khong can cai lai khi co ban moi.'
