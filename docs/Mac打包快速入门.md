# Mac 打包快速入门 🚀

## 🎯 目标

将Python程序打包成 **真正的Mac应用程序**，用户**无需安装Python**即可使用！

---

## ⚡ 三步完成打包

### 第1步：在Mac上准备环境

```bash
# 只需要第一次执行
pip3 install pyinstaller
```

### 第2步：运行打包脚本

```bash
# 进入项目目录
cd /path/to/ppt

# 添加执行权限（只需第一次）
chmod +x build_mac.sh create_dmg.sh create_pkg.sh

# 打包成.app应用
./build_mac.sh

# 创建DMG安装包（推荐）
./create_dmg.sh
```

### 第3步：分发给用户

```bash
# 成品在这里：
dist/PPT背景替换工具_v1.2.0.dmg
```

---

## 📦 用户安装体验

### 方式1：DMG（推荐）

用户操作：
1. 双击 `.dmg` 文件
2. 拖拽应用到 Applications 文件夹
3. 完成！

### 方式2：PKG

用户操作：
1. 双击 `.pkg` 文件
2. 点击"继续" → "安装"
3. 完成！

---

## 🆚 对比：新方式 vs 旧方式

| 项目 | 旧方式（脚本） | 新方式（打包） |
|------|-------------|-------------|
| **用户需要安装Python** | ✅ 需要 | ❌ 不需要 |
| **用户需要装依赖库** | ✅ 需要 | ❌ 不需要 |
| **用户需要用终端** | ✅ 需要 | ❌ 不需要 |
| **安装步骤** | 5-6步 | 2步 |
| **安装时间** | 5-10分钟 | 30秒 |
| **技术门槛** | 高 | 零 |
| **出错可能** | 高 | 低 |

---

## 🎁 已创建的文件

```
ppt/
├── build_mac_app.spec      # PyInstaller配置文件
├── build_mac.sh            # 打包成.app的脚本
├── create_dmg.sh           # 创建DMG安装包
├── create_pkg.sh           # 创建PKG安装包
└── docs/
    └── Mac打包完整指南.md  # 详细文档（问题解决）
```

---

## ❓ 常见问题快速解决

### Q: 用户打开时提示"无法打开"

**解决方案（用户执行）：**
```bash
xattr -cr /Applications/PPT背景替换工具.app
```

或者：右键点击应用 → 选择"打开" → 确认

### Q: 打包的文件太大

在 `build_mac_app.spec` 中添加更多排除项：
```python
excludes=[
    'matplotlib', 'numpy', 'pandas', 'scipy',
    'pytest', 'setuptools', 'distutils',
]
```

### Q: 如何添加应用图标

1. 准备 `.icns` 图标文件
2. 在 `build_mac_app.spec` 中设置：
   ```python
   icon='icon.icns',
   ```

---

## 💡 提示

- ✅ 打包需要在 **Mac 电脑** 上进行
- ✅ 打包后的应用可以在其他Mac上运行
- ✅ 支持 Intel 和 Apple Silicon Mac
- ✅ 建议最低支持 macOS 10.13+

---

## 📚 更多信息

详细文档（包含高级功能和问题排查）：
👉 `docs/Mac打包完整指南.md`

---

**就是这么简单！祝打包顺利！🎉**

