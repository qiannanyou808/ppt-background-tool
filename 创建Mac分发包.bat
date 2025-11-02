@echo off
chcp 65001 >nul
title 创建 Mac 分发包
echo ====================================
echo 创建 Mac 用户分发包
echo ====================================
echo.

echo 创建临时目录...
if exist "Mac_Package" rd /s /q "Mac_Package"
mkdir "Mac_Package"

echo 复制必要文件...
copy "ppt_background_replacer.py" "Mac_Package\"
copy "install_mac.sh" "Mac_Package\"
copy "run_mac.sh" "Mac_Package\"
copy "Mac用户使用说明.txt" "Mac_Package\"
copy "README.md" "Mac_Package\" 2>nul
copy "LICENSE.txt" "Mac_Package\" 2>nul

echo.
echo ====================================
echo ✓ 文件准备完成！
echo ====================================
echo.
echo 接下来：
echo 1. 进入 Mac_Package 文件夹
echo 2. 压缩整个文件夹为 .zip
echo 3. 将 .zip 文件发给 Mac 用户
echo.
echo 正在打开文件夹...
explorer "Mac_Package"
echo.
pause


