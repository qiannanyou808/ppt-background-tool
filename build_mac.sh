#!/bin/bash
# Mac应用程序打包脚本
# 使用PyInstaller将Python程序打包成.app

echo "=================================="
echo "PPT背景替换工具 - Mac打包脚本"
echo "=================================="
echo ""

# 检查Python环境
if ! command -v python3 &> /dev/null; then
    echo "❌ 未检测到 Python 3"
    exit 1
fi

echo "✓ Python 版本: $(python3 --version)"
echo ""

# 检查并安装PyInstaller
echo "检查PyInstaller..."
if ! pip3 show pyinstaller &> /dev/null; then
    echo "安装PyInstaller..."
    pip3 install pyinstaller
fi

echo "✓ PyInstaller 已准备就绪"
echo ""

# 清理旧的构建文件
echo "清理旧的构建文件..."
rm -rf build dist
echo ""

# 开始打包
echo "开始打包应用程序..."
echo "这可能需要几分钟时间，请耐心等待..."
echo ""

pyinstaller --clean build_mac_app.spec

# 检查打包结果
if [ -d "dist/PPT背景替换工具.app" ]; then
    echo ""
    echo "=================================="
    echo "✓ 打包成功！"
    echo "=================================="
    echo ""
    echo "应用程序位置: dist/PPT背景替换工具.app"
    echo ""
    echo "下一步操作："
    echo "1. 测试应用: open 'dist/PPT背景替换工具.app'"
    echo "2. 创建DMG: ./create_dmg.sh"
    echo "3. 创建PKG: ./create_pkg.sh"
    echo ""
else
    echo ""
    echo "❌ 打包失败"
    echo "请检查错误信息"
    exit 1
fi

