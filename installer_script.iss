; PPT背景替换工具 - Inno Setup 安装脚本
; 使用方法：
; 1. 下载并安装 Inno Setup: https://jrsoftware.org/isdl.php
; 2. 右键此文件 -> 使用 Inno Setup 编译
; 3. 生成安装包在 Output 文件夹

#define MyAppName "PPT背景替换工具"
#define MyAppVersion "1.2.0"
#define MyAppPublisher "您的名字/组织"
#define MyAppURL "https://your-website.com"
#define MyAppExeName "PPT背景替换工具.exe"

[Setup]
; 应用程序基本信息
AppId={{A1B2C3D4-E5F6-G7H8-I9J0-K1L2M3N4O5P6}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=LICENSE.txt
InfoBeforeFile=安装前说明.txt
OutputDir=Installer_Output
OutputBaseFilename=PPT背景替换工具_v{#MyAppVersion}_安装程序
; SetupIconFile=app.ico  ; 暂时禁用图标（可选）
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

; 安装界面语言（使用英文，避免语言文件缺失问题）
[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

; 桌面图标
[Tasks]
Name: "desktopicon"; Description: "创建桌面快捷方式"; GroupDescription: "附加图标:"; Flags: unchecked
Name: "quicklaunchicon"; Description: "创建快速启动栏快捷方式"; GroupDescription: "附加图标:"; Flags: unchecked

; 要安装的文件
[Files]
Source: "dist\PPT背景替换工具\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; 说明文档
Source: "README.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "使用指南.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "docs\*"; DestDir: "{app}\docs"; Flags: ignoreversion recursesubdirs

; 开始菜单快捷方式
[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\卸载 {#MyAppName}"; Filename: "{uninstallexe}"
Name: "{group}\使用说明"; Filename: "{app}\README.md"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

; 运行程序
[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "立即运行 {#MyAppName}"; Flags: nowait postinstall skipifsilent

; 卸载后清理
[UninstallDelete]
Type: filesandordirs; Name: "{app}"




