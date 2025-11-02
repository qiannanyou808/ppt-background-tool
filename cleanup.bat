@echo off
chcp 65001 >nul
REM 工作空间清理脚本 - Windows版本

echo ====================================
echo 工作空间清理工具
echo ====================================
echo.

echo 这个脚本会清理以下内容：
echo [1] 临时构建文件（__pycache__, build）
echo [2] 整理文档到docs文件夹
echo [3] 移动学习版代码到docs\learning
echo.
echo 重要文件不会被删除（dist, Installer_Output, Mac_Package）
echo.

choice /C YN /M "确定要继续吗"
if errorlevel 2 goto :cancel
if errorlevel 1 goto :cleanup

:cleanup
echo.
echo ====================================
echo 开始清理...
echo ====================================
echo.

REM 1. 删除Python缓存
echo [1/5] 清理Python缓存...
if exist "__pycache__" (
    rmdir /s /q "__pycache__"
    echo   ✓ 已删除 __pycache__
) else (
    echo   - __pycache__ 不存在
)

REM 2. 删除构建临时文件
echo.
echo [2/5] 清理构建临时文件...
if exist "build" (
    rmdir /s /q "build"
    echo   ✓ 已删除 build/
) else (
    echo   - build/ 不存在
)

REM 3. 创建learning文件夹
echo.
echo [3/5] 创建学习资源文件夹...
if not exist "docs\learning" (
    mkdir "docs\learning"
    echo   ✓ 已创建 docs\learning\
)

REM 4. 移动学习版代码
echo.
echo [4/5] 移动学习版代码...
if exist "ppt_background_replacer_学习版.py" (
    move "ppt_background_replacer_学习版.py" "docs\learning\" >nul
    echo   ✓ 已移动 ppt_background_replacer_学习版.py
)

REM 5. 移动文档文件
echo.
echo [5/5] 整理文档文件...

set "moved_count=0"

if exist "优化建议.txt" (
    move "优化建议.txt" "docs\" >nul 2>&1
    set /a moved_count+=1
)

if exist "使用指南.txt" (
    if not exist "docs\使用指南.txt" (
        move "使用指南.txt" "docs\" >nul 2>&1
        set /a moved_count+=1
    )
)

if exist "安装前说明.txt" (
    move "安装前说明.txt" "docs\" >nul 2>&1
    set /a moved_count+=1
)

if exist "新手学习指南.txt" (
    move "新手学习指南.txt" "docs\learning\" >nul 2>&1
    set /a moved_count+=1
)

if exist "项目说明.txt" (
    move "项目说明.txt" "docs\" >nul 2>&1
    set /a moved_count+=1
)

if exist "Mac打包快速入门.md" (
    move "Mac打包快速入门.md" "docs\" >nul 2>&1
    set /a moved_count+=1
)

if exist "README_Mac安装方式对比.md" (
    move "README_Mac安装方式对比.md" "docs\" >nul 2>&1
    set /a moved_count+=1
)

echo   ✓ 已整理 %moved_count% 个文档文件

REM 6. 删除根目录的Mac重复文件
echo.
echo [额外清理] 删除根目录的Mac重复文件...
if exist "Mac用户使用说明.txt" (
    del "Mac用户使用说明.txt" >nul 2>&1
    echo   ✓ 已删除 Mac用户使用说明.txt （保留Mac_Package中的版本）
)

echo.
echo ====================================
echo ✓ 清理完成！
echo ====================================
echo.

echo 清理结果：
echo - 已删除临时文件（__pycache__, build）
echo - 文档已整理到 docs\ 文件夹
echo - 学习资源已移动到 docs\learning\
echo.
echo 保留的重要文件：
echo - dist\ （Windows可执行程序）
echo - Installer_Output\ （Windows安装程序）
echo - Mac_Package\ （Mac分发包）
echo - 所有源代码和脚本文件
echo.

REM 创建清理报告
echo 工作空间清理报告 > 清理报告.txt
echo ==================== >> 清理报告.txt
echo. >> 清理报告.txt
echo 清理时间: %date% %time% >> 清理报告.txt
echo. >> 清理报告.txt
echo 已删除: >> 清理报告.txt
echo - __pycache__/ >> 清理报告.txt
echo - build/ >> 清理报告.txt
echo. >> 清理报告.txt
echo 已移动: >> 清理报告.txt
echo - 文档文件 -> docs/ >> 清理报告.txt
echo - 学习资源 -> docs/learning/ >> 清理报告.txt
echo. >> 清理报告.txt

echo 📄 清理报告已保存到: 清理报告.txt
echo.

goto :end

:cancel
echo.
echo 已取消清理操作
echo.

:end
pause

