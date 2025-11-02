#!/bin/bash
# PPT背景替换工具 - Mac 安装脚本

echo "=================================="
echo "PPT背景替换工具 - Mac 安装"
echo "=================================="
echo ""

# 检查 Python
if ! command -v python3 &> /dev/null; then
    echo "❌ 未检测到 Python 3"
    echo ""
    echo "请先安装 Python 3:"
    echo "https://www.python.org/downloads/"
    exit 1
fi

echo "✓ Python 已安装: $(python3 --version)"
echo ""

# 安装依赖
echo "安装依赖库..."
pip3 install python-pptx pillow lxml customtkinter

if [ $? -eq 0 ]; then
    echo ""
    echo "=================================="
    echo "✓ 安装完成！"
    echo "=================================="
    echo ""
    echo "运行方式："
    echo "  python3 ppt_background_replacer.py"
    echo ""
    echo "或者双击运行: run_mac.sh"
    echo ""
else
    echo ""
    echo "❌ 安装失败"
    echo "请检查错误信息"
fi


