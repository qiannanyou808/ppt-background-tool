#!/bin/bash
# 一键打包Mac应用程序和所有安装包

echo "=================================="
echo "PPT背景替换工具 - 一键打包"
echo "=================================="
echo ""

# 检查是否在Mac上运行
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ 此脚本只能在Mac上运行"
    echo "   请使用Mac电脑进行打包"
    exit 1
fi

# 检查Python
if ! command -v python3 &> /dev/null; then
    echo "❌ 未检测到 Python 3"
    echo "   请访问: https://www.python.org/downloads/"
    exit 1
fi

echo "✓ Python: $(python3 --version)"

# 检查PyInstaller
if ! pip3 show pyinstaller &> /dev/null; then
    echo "安装 PyInstaller..."
    pip3 install pyinstaller
    if [ $? -ne 0 ]; then
        echo "❌ PyInstaller 安装失败"
        exit 1
    fi
fi

echo "✓ PyInstaller 已准备就绪"
echo ""

# 添加执行权限
chmod +x build_mac.sh create_dmg.sh create_pkg.sh

# 步骤1: 打包.app
echo "【步骤 1/3】打包应用程序..."
echo "=================================="
./build_mac.sh

if [ ! -d "dist/PPT背景替换工具.app" ]; then
    echo "❌ 应用程序打包失败"
    exit 1
fi

echo ""
echo "✓ 应用程序打包完成"
echo ""

# 步骤2: 创建DMG
echo "【步骤 2/3】创建 DMG 安装包..."
echo "=================================="
./create_dmg.sh

if [ ! -f "dist/PPT背景替换工具_v"*".dmg" ]; then
    echo "⚠️  DMG 创建失败，继续..."
fi

echo ""

# 步骤3: 创建PKG
echo "【步骤 3/3】创建 PKG 安装包..."
echo "=================================="
./create_pkg.sh

if [ ! -f "dist/PPT背景替换工具_v"*".pkg" ]; then
    echo "⚠️  PKG 创建失败，继续..."
fi

echo ""
echo "=================================="
echo "✅ 打包完成！"
echo "=================================="
echo ""

# 显示结果
echo "📦 打包结果："
echo "-----------------------------------"
ls -lh dist/ | grep -E '\.app|\.dmg|\.pkg'
echo "-----------------------------------"
echo ""

# 显示文件大小
echo "📊 文件大小："
du -sh dist/PPT背景替换工具.app 2>/dev/null && echo "   ↑ 应用程序"
du -sh dist/PPT背景替换工具_v*.dmg 2>/dev/null && echo "   ↑ DMG安装包"
du -sh dist/PPT背景替换工具_v*.pkg 2>/dev/null && echo "   ↑ PKG安装包"
echo ""

echo "🎯 下一步："
echo "1. 测试应用: open 'dist/PPT背景替换工具.app'"
echo "2. 测试DMG:  open dist/PPT背景替换工具_v*.dmg"
echo "3. 分发给用户：上传DMG文件"
echo ""

echo "💡 提示："
echo "- 推荐分发 DMG 文件（最符合Mac用户习惯）"
echo "- PKG 适合企业批量部署"
echo ""

