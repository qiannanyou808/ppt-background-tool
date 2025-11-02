@echo off
chcp 65001 >nul
echo ====================================
echo PPT背景替换工具 - 打包成文件夹
echo （更快启动，更少误报）
echo ====================================
echo.

echo [1/4] 检查PyInstaller...
pip show pyinstaller >nul 2>&1
if errorlevel 1 (
    echo PyInstaller未安装，正在安装...
    pip install pyinstaller
) else (
    echo ✓ PyInstaller已安装
)
echo.

echo [2/4] 清理旧文件...
if exist build rd /s /q build
if exist dist rd /s /q dist
echo ✓ 清理完成
echo.

echo [3/4] 开始打包（文件夹模式）...
echo 这样启动更快，杀毒软件误报更少
echo.

pyinstaller --windowed --name "PPT背景替换工具" ^
    --hidden-import=customtkinter ^
    --hidden-import=PIL ^
    --collect-all customtkinter ^
    ppt_background_replacer.py

echo.
echo [4/4] 打包完成！
echo.
echo 可执行文件位置: dist\PPT背景替换工具\PPT背景替换工具.exe
echo.
echo 分发时请将整个 "PPT背景替换工具" 文件夹打包发送
echo.
echo 按任意键退出...
pause >nul


