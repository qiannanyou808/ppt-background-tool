@echo off
title 清理临时文件
echo ====================================
echo 清理打包产生的临时文件
echo ====================================
echo.

if exist build (
    rd /s /q build
    echo ✓ 已删除 build 文件夹
)

if exist dist (
    rd /s /q dist
    echo ✓ 已删除 dist 文件夹
)

if exist "PPT背景替换工具.spec" (
    del "PPT背景替换工具.spec"
    echo ✓ 已删除自动生成的spec文件
)

for %%f in (*.spec) do (
    if not "%%f"=="ppt_background_replacer.spec" (
        del "%%f"
        echo ✓ 已删除 %%f
    )
)

echo.
echo 清理完成！
echo.
echo 按任意键退出...
pause >nul

