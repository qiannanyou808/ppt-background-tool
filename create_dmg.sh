#!/bin/bash
# 创建DMG磁盘映像文件
# DMG是Mac最常见的应用分发方式，用户只需拖拽安装

echo "=================================="
echo "创建 DMG 安装包"
echo "=================================="
echo ""

APP_NAME="PPT背景替换工具"
VERSION="1.2.0"
DMG_NAME="${APP_NAME}_v${VERSION}"
APP_PATH="dist/${APP_NAME}.app"
DMG_TEMP="dmg_temp"
DMG_OUTPUT="dist/${DMG_NAME}.dmg"

# 检查.app是否存在
if [ ! -d "$APP_PATH" ]; then
    echo "❌ 未找到应用程序: $APP_PATH"
    echo "请先运行 ./build_mac.sh 进行打包"
    exit 1
fi

echo "✓ 找到应用程序"
echo ""

# 创建临时目录
echo "创建临时目录..."
rm -rf "$DMG_TEMP"
mkdir -p "$DMG_TEMP"

# 复制应用程序
echo "复制应用程序..."
cp -R "$APP_PATH" "$DMG_TEMP/"

# 创建应用程序文件夹的快捷方式
echo "创建应用程序快捷方式..."
ln -s /Applications "$DMG_TEMP/Applications"

# 添加README
cat > "$DMG_TEMP/安装说明.txt" << EOF
================================
PPT背景替换工具 - 安装说明
================================

📦 安装方法：
-----------
将 "${APP_NAME}.app" 拖拽到 "Applications" 文件夹

🚀 使用方法：
-----------
1. 在"应用程序"文件夹中找到"${APP_NAME}"
2. 双击打开
3. 如果遇到安全提示：
   - 打开"系统偏好设置" → "安全性与隐私"
   - 点击"仍要打开"

💡 提示：
--------
- 首次运行可能需要几秒钟加载
- 确保macOS版本 >= 10.13
- 支持 .pptx 格式的PowerPoint文件

版本: v${VERSION}
================================
EOF

echo "创建DMG文件..."

# 删除旧的DMG
rm -f "$DMG_OUTPUT"

# 创建DMG
# 方法1: 使用hdiutil (macOS自带)
hdiutil create -volname "$APP_NAME" \
    -srcfolder "$DMG_TEMP" \
    -ov -format UDZO \
    "$DMG_OUTPUT"

if [ $? -eq 0 ]; then
    echo ""
    echo "=================================="
    echo "✓ DMG创建成功！"
    echo "=================================="
    echo ""
    echo "DMG位置: $DMG_OUTPUT"
    echo "文件大小: $(du -h "$DMG_OUTPUT" | cut -f1)"
    echo ""
    echo "用户只需："
    echo "1. 双击打开DMG文件"
    echo "2. 将应用拖拽到Applications文件夹"
    echo "3. 双击打开使用"
    echo ""
else
    echo ""
    echo "❌ DMG创建失败"
    exit 1
fi

# 清理临时文件
echo "清理临时文件..."
rm -rf "$DMG_TEMP"

echo "完成！"

