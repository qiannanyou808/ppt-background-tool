@echo off
chcp 65001 >nul
echo ====================================
echo 安装PPT背景替换工具依赖包
echo ====================================
echo.

echo 正在安装依赖包...
pip install -r requirements.txt

echo.
echo ====================================
echo 安装完成！
echo ====================================
echo.
echo 现在可以运行程序了：
echo   python ppt_background_replacer.py
echo.
echo 或者打包成EXE：
echo   运行 build_exe.bat
echo.
echo 按任意键退出...
pause >nul

