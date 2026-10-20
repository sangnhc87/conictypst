; Trình cài Sang Math cho Word (Windows). Dịch bằng Inno Setup: iscc SangMath.iss
[Setup]
AppName=Sang Math cho Word
AppVersion={#AppVer}
AppPublisher=Nguyễn Văn Sang
DefaultDirName={localappdata}\SangMath
PrivilegesRequired=lowest
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputBaseFilename=SangMath-Setup
OutputDir=out
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
UninstallDisplayName=Sang Math cho Word
[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
[Files]
Source: "install.ps1"; DestDir: "{app}"; Flags: ignoreversion
Source: "uninstall.ps1"; DestDir: "{app}"; Flags: ignoreversion
[Run]
Filename: "powershell.exe"; Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{app}\install.ps1"""; Flags: runhidden waituntilterminated; StatusMsg: "Đang đăng ký Sang Math với Word (cần Internet)..."
[UninstallRun]
Filename: "powershell.exe"; Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{app}\uninstall.ps1"""; Flags: runhidden waituntilterminated
[Code]
procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpFinished then
    WizardForm.FinishedLabel.Caption := 'Đã cài xong. Thoát hẳn Word rồi mở lại, vào Insert > My Add-ins > Developer Add-ins > Sang Math.';
end;
