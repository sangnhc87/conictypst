$id  = '1392035f-25bf-4817-81b9-523377b1695e'
$key = 'HKCU:\Software\Microsoft\Office\16.0\WEF\Developer'
Remove-ItemProperty -Path $key -Name $id -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path $env:LOCALAPPDATA 'SangMath\manifest.xml') -Force -ErrorAction SilentlyContinue
