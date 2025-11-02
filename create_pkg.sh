#!/bin/bash
# 创建PKG安装包
# PKG是Mac的标准安装包格式，可以自动安装到应用程序文件夹

echo "=================================="
echo "创建 PKG 安装包"
echo "=================================="
echo ""

APP_NAME="PPT背景替换工具"
VERSION="1.2.0"
PKG_NAME="${APP_NAME}_v${VERSION}"
APP_PATH="dist/${APP_NAME}.app"
PKG_OUTPUT="dist/${PKG_NAME}.pkg"
PKG_TEMP="pkg_temp"

# 检查.app是否存在
if [ ! -d "$APP_PATH" ]; then
    echo "❌ 未找到应用程序: $APP_PATH"
    echo "请先运行 ./build_mac.sh 进行打包"
    exit 1
fi

echo "✓ 找到应用程序"
echo ""

# 创建临时目录结构
echo "准备安装包结构..."
rm -rf "$PKG_TEMP"
mkdir -p "$PKG_TEMP/Applications"

# 复制应用程序
echo "复制应用程序..."
cp -R "$APP_PATH" "$PKG_TEMP/Applications/"

# 创建PKG
echo "创建PKG安装包..."
rm -f "$PKG_OUTPUT"

pkgbuild --root "$PKG_TEMP" \
    --identifier "com.ppttools.background-replacer" \
    --version "$VERSION" \
    --install-location "/" \
    "$PKG_OUTPUT"

if [ $? -eq 0 ]; then
    echo ""
    echo "=================================="
    echo "✓ PKG创建成功！"
    echo "=================================="
    echo ""
    echo "PKG位置: $PKG_OUTPUT"
    echo "文件大小: $(du -h "$PKG_OUTPUT" | cut -f1)"
    echo ""
    echo "用户只需："
    echo "1. 双击PKG文件"
    echo "2. 按照提示点击"继续"和"安装""
    echo "3. 安装完成后在应用程序文件夹中打开"
    echo ""
    echo "提示: PKG安装包会自动将应用安装到 /Applications 目录"
    echo ""
else
    echo ""
    echo "❌ PKG创建失败"
    exit 1
fi

# 清理临时文件
echo "清理临时文件..."
rm -rf "$PKG_TEMP"

echo "完成！"

