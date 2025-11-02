#!/bin/bash
# 工作空间清理脚本 - Mac/Linux版本

echo "===================================="
echo "工作空间清理工具"
echo "===================================="
echo ""

echo "这个脚本会清理以下内容："
echo "[1] 临时构建文件（__pycache__, build）"
echo "[2] 整理文档到docs文件夹"
echo "[3] 移动学习版代码到docs/learning"
echo ""
echo "重要文件不会被删除（dist, Installer_Output, Mac_Package）"
echo ""

read -p "确定要继续吗？(y/n) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "已取消清理操作"
    exit 0
fi

echo ""
echo "===================================="
echo "开始清理..."
echo "===================================="
echo ""

moved_count=0

# 1. 删除Python缓存
echo "[1/5] 清理Python缓存..."
if [ -d "__pycache__" ]; then
    rm -rf "__pycache__"
    echo "  ✓ 已删除 __pycache__"
else
    echo "  - __pycache__ 不存在"
fi

# 2. 删除构建临时文件
echo ""
echo "[2/5] 清理构建临时文件..."
if [ -d "build" ]; then
    rm -rf "build"
    echo "  ✓ 已删除 build/"
else
    echo "  - build/ 不存在"
fi

# 3. 创建learning文件夹
echo ""
echo "[3/5] 创建学习资源文件夹..."
if [ ! -d "docs/learning" ]; then
    mkdir -p "docs/learning"
    echo "  ✓ 已创建 docs/learning/"
fi

# 4. 移动学习版代码
echo ""
echo "[4/5] 移动学习版代码..."
if [ -f "ppt_background_replacer_学习版.py" ]; then
    mv "ppt_background_replacer_学习版.py" "docs/learning/"
    echo "  ✓ 已移动 ppt_background_replacer_学习版.py"
    ((moved_count++))
fi

# 5. 移动文档文件
echo ""
echo "[5/5] 整理文档文件..."

# 移动到docs根目录
for file in "优化建议.txt" "安装前说明.txt" "项目说明.txt" "Mac打包快速入门.md" "README_Mac安装方式对比.md"; do
    if [ -f "$file" ]; then
        mv "$file" "docs/"
        ((moved_count++))
    fi
done

# 使用指南.txt特殊处理（可能已存在）
if [ -f "使用指南.txt" ]; then
    if [ ! -f "docs/使用指南.txt" ]; then
        mv "使用指南.txt" "docs/"
        ((moved_count++))
    fi
fi

# 移动到learning子文件夹
if [ -f "新手学习指南.txt" ]; then
    mv "新手学习指南.txt" "docs/learning/"
    ((moved_count++))
fi

echo "  ✓ 已整理 $moved_count 个文档文件"

# 6. 删除根目录的Mac重复文件
echo ""
echo "[额外清理] 删除根目录的Mac重复文件..."
if [ -f "Mac用户使用说明.txt" ]; then
    rm "Mac用户使用说明.txt"
    echo "  ✓ 已删除 Mac用户使用说明.txt （保留Mac_Package中的版本）"
fi

echo ""
echo "===================================="
echo "✓ 清理完成！"
echo "===================================="
echo ""

echo "清理结果："
echo "- 已删除临时文件（__pycache__, build）"
echo "- 文档已整理到 docs/ 文件夹"
echo "- 学习资源已移动到 docs/learning/"
echo ""
echo "保留的重要文件："
echo "- dist/ （可执行程序）"
echo "- Installer_Output/ （安装程序）"
echo "- Mac_Package/ （Mac分发包）"
echo "- 所有源代码和脚本文件"
echo ""

# 创建清理报告
cat > 清理报告.txt << EOF
工作空间清理报告
====================

清理时间: $(date)

已删除:
- __pycache__/
- build/

已移动:
- 文档文件 -> docs/
- 学习资源 -> docs/learning/

EOF

echo "📄 清理报告已保存到: 清理报告.txt"
echo ""

