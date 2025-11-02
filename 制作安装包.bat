@echo off
title PPT背景替换工具 - 制作安装包
echo ====================================
echo PPT背景替换工具 - 一键制作安装包
echo ====================================
echo.

echo 检查前提条件...
echo.

REM 检查Inno Setup是否安装（支持多个可能的安装路径）
set ISCC=
if exist "C:\Program Files (x86)\Inno Setup 6\ISCC.exe" set ISCC="C:\Program Files (x86)\Inno Setup 6\ISCC.exe"
if exist "C:\Program Files\Inno Setup 6\ISCC.exe" set ISCC="C:\Program Files\Inno Setup 6\ISCC.exe"
if exist "C:\Program Files (x86)\Inno Setup 5\ISCC.exe" set ISCC="C:\Program Files (x86)\Inno Setup 5\ISCC.exe"
if exist "C:\Program Files\Inno Setup 5\ISCC.exe" set ISCC="C:\Program Files\Inno Setup 5\ISCC.exe"

if "%ISCC%"=="" (
    echo [X] 未检测到 Inno Setup
    echo.
    echo 已尝试以下路径:
    echo   - C:\Program Files (x86)\Inno Setup 6\
    echo   - C:\Program Files\Inno Setup 6\
    echo   - C:\Program Files (x86)\Inno Setup 5\
    echo   - C:\Program Files\Inno Setup 5\
    echo.
    echo 请确认 Inno Setup 的安装位置, 或手动右键点击
    echo installer_script.iss 选择"Compile"
    echo.
    echo 按任意键退出...
    pause >nul
    exit /b
)

echo [OK] Inno Setup 已安装
echo.

REM 检查是否已打包程序
if not exist "dist\PPT背景替换工具\PPT背景替换工具.exe" (
    echo [X] 未找到打包的程序文件
    echo.
    echo 正在运行打包脚本...
    call build_exe_folder.bat
    echo.
)

if not exist "dist\PPT背景替换工具\PPT背景替换工具.exe" (
    echo [X] 打包失败, 请手动运行 build_exe_folder.bat
    echo.
    echo 按任意键退出...
    pause >nul
    exit /b
)

echo [OK] 程序文件准备完成
echo.

echo 开始制作安装包...
echo.

%ISCC% installer_script.iss

if errorlevel 1 (
    echo.
    echo [X] 安装包制作失败
    echo 请查看错误信息
    echo.
    echo 按任意键退出...
    pause >nul
    exit /b
)

echo.
echo ====================================
echo [OK] 安装包制作成功!
echo ====================================
echo.
echo 安装包位置:
echo Installer_Output\PPT背景替换工具_v1.2.0_安装程序.exe
echo.
echo 现在可以将这个安装包发给用户了!
echo.

REM 询问是否打开文件夹
set /p open="是否打开安装包所在文件夹? (Y/N): "
if /i "%open%"=="Y" (
    if exist "Installer_Output" (
        explorer Installer_Output
    )
)

echo.
echo 按任意键退出...
pause >nul
