# 如何创建Mac PKG安装包

## 📦 什么是PKG安装包？

PKG (Package) 是Mac系统的**标准安装包格式**，类似于Windows的MSI安装包。

### 特点对比

| 特性 | PKG | DMG |
|------|-----|-----|
| **安装方式** | 安装向导，自动安装到Applications | 拖拽安装 |
| **用户操作** | 双击→按提示安装 | 双击→拖拽 |
| **是否需要权限** | 可能需要管理员权限 | 不需要 |
| **适用场景** | 企业部署、自动化安装 | 个人用户、常规分发 |
| **卸载方式** | 可以集成卸载脚本 | 手动删除 |
| **Mac用户熟悉度** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

---

## 🚀 快速创建PKG（三种方式）

### 方式1️⃣：一键打包（推荐）

创建.app + DMG + PKG 所有安装包：

```bash
# 在Mac终端中执行
cd /path/to/ppt

# 添加执行权限（首次）
chmod +x 一键打包Mac.sh

# 一键打包所有格式
./一键打包Mac.sh
```

**这个命令会自动：**
1. ✅ 打包Python程序为.app
2. ✅ 创建DMG安装包
3. ✅ 创建PKG安装包

---

### 方式2️⃣：仅创建PKG

如果你已经有了.app文件，只想创建PKG：

```bash
# 前提：已经运行过 ./build_mac.sh

# 创建PKG
chmod +x create_pkg.sh
./create_pkg.sh
```

---

### 方式3️⃣：分步操作（手动控制）

```bash
# 步骤1: 打包成.app
chmod +x build_mac.sh
./build_mac.sh

# 步骤2: 创建PKG
chmod +x create_pkg.sh
./create_pkg.sh
```

---

## 📋 完整操作步骤详解

### 前置要求

1. **Mac电脑** - 必须在Mac上进行打包
2. **Python 3.8+** - 用于运行打包脚本
3. **PyInstaller** - Python打包工具
4. **项目源码** - 完整的ppt项目文件

### 步骤1: 准备环境

```bash
# 检查Python版本
python3 --version
# 应该显示 Python 3.8 或更高

# 安装PyInstaller（如果还没安装）
pip3 install pyinstaller

# 验证安装
pyinstaller --version
```

### 步骤2: 打包应用程序

```bash
# 进入项目目录
cd /path/to/ppt

# 给脚本添加执行权限
chmod +x build_mac.sh create_pkg.sh

# 打包成.app应用程序
./build_mac.sh
```

**输出示例：**
```
==================================
PPT背景替换工具 - Mac打包脚本
==================================

✓ Python 版本: Python 3.11.5
✓ PyInstaller 已准备就绪

清理旧的构建文件...
开始打包应用程序...
这可能需要几分钟时间，请耐心等待...

... [打包过程] ...

==================================
✓ 打包成功！
==================================

应用程序位置: dist/PPT背景替换工具.app
```

### 步骤3: 创建PKG安装包

```bash
# 运行PKG创建脚本
./create_pkg.sh
```

**输出示例：**
```
==================================
创建 PKG 安装包
==================================

✓ 找到应用程序

准备安装包结构...
复制应用程序...
创建PKG安装包...

==================================
✓ PKG创建成功！
==================================

PKG位置: dist/PPT背景替换工具_v1.2.0.pkg
文件大小: 85M

用户只需：
1. 双击PKG文件
2. 按照提示点击"继续"和"安装"
3. 安装完成后在应用程序文件夹中打开

提示: PKG安装包会自动将应用安装到 /Applications 目录
```

### 步骤4: 测试PKG

```bash
# 打开PKG文件测试
open "dist/PPT背景替换工具_v1.2.0.pkg"
```

**测试安装流程：**
1. 双击PKG文件
2. 看到安装向导
3. 点击"继续"
4. 点击"安装"
5. 输入管理员密码（如果需要）
6. 安装完成
7. 在Applications文件夹找到应用

---

## 📁 生成文件说明

创建成功后，你会在 `dist/` 文件夹中看到：

```
dist/
├── PPT背景替换工具.app              # Mac应用程序
└── PPT背景替换工具_v1.2.0.pkg       # PKG安装包（分发用）
```

**文件大小参考：**
- `.app` 文件：~80-100 MB
- `.pkg` 文件：~80-100 MB（压缩效果有限）

---

## 🎯 PKG vs DMG：应该用哪个？

### 使用PKG的场景 ✅

1. **企业环境部署**
   ```
   - IT部门批量安装
   - 自动化部署脚本
   - 远程安装
   ```

2. **需要复杂安装逻辑**
   ```
   - 安装前检查系统版本
   - 安装后设置配置
   - 集成卸载脚本
   ```

3. **Mac App Store外的专业软件**
   ```
   - 开发工具
   - 企业应用
   - 系统工具
   ```

### 使用DMG的场景 ✅ （更推荐）

1. **面向普通用户**
   ```
   - 个人用户下载使用
   - 开源软件分发
   - 常规应用程序
   ```

2. **希望简单的安装体验**
   ```
   - 拖拽即可安装
   - 不需要管理员权限
   - 更符合Mac用户习惯
   ```

3. **需要美观的安装界面**
   ```
   - 可以自定义背景
   - 可以添加说明
   - 更专业的外观
   ```

---

## ⚙️ 高级配置

### 自定义PKG设置

编辑 `create_pkg.sh` 文件：

```bash
# 修改版本号
VERSION="1.2.1"

# 修改包标识符
--identifier "com.yourcompany.yourapp"

# 修改安装位置（通常不建议改）
--install-location "/Applications"
```

### 添加安装前/后脚本

创建 `preinstall.sh`（安装前执行）：

```bash
#!/bin/bash
# 检查系统版本
if [[ $(sw_vers -productVersion | cut -d. -f1) -lt 10 ]]; then
    echo "需要 macOS 10.13 或更高版本"
    exit 1
fi
```

创建 `postinstall.sh`（安装后执行）：

```bash
#!/bin/bash
# 创建默认配置文件
mkdir -p ~/Documents/PPT背景替换工具
echo "安装完成！" > ~/Documents/PPT背景替换工具/README.txt
```

在 `create_pkg.sh` 中添加：

```bash
pkgbuild --root "$PKG_TEMP" \
    --identifier "com.ppttools.background-replacer" \
    --version "$VERSION" \
    --install-location "/" \
    --scripts scripts/  \  # 添加这一行
    "$PKG_OUTPUT"
```

### 代码签名（需要Apple Developer账号）

```bash
# 签名PKG
productsign --sign "Developer ID Installer: Your Name (TEAM_ID)" \
    "dist/PPT背景替换工具_v1.2.0.pkg" \
    "dist/PPT背景替换工具_v1.2.0_signed.pkg"
```

---

## ❓ 常见问题

### Q1: 创建PKG时提示权限错误？

**解决方案：**
```bash
# 给脚本添加执行权限
chmod +x create_pkg.sh

# 如果还是不行，尝试用sudo（不推荐）
sudo ./create_pkg.sh
```

### Q2: 用户安装时提示"需要管理员权限"？

这是正常的，因为PKG要安装到 `/Applications` 目录。

**可选方案：**
- 改用DMG（不需要管理员权限）
- 或者在PKG描述中说明需要权限

### Q3: PKG文件太大？

**优化方案：**

1. 在 `build_mac_app.spec` 中排除不需要的模块：
```python
excludes=[
    'matplotlib', 'numpy', 'pandas', 'scipy',
    'pytest', 'setuptools', 'distutils',
]
```

2. 启用UPX压缩：
```python
upx=True,
upx_exclude=[],
```

### Q4: 如何让用户卸载？

**方法1: 提供卸载脚本**

创建 `uninstall.sh`：
```bash
#!/bin/bash
echo "卸载 PPT背景替换工具..."
sudo rm -rf "/Applications/PPT背景替换工具.app"
echo "卸载完成！"
```

**方法2: 在说明中告知**
```
卸载方法：
1. 打开Finder
2. 进入"应用程序"文件夹
3. 找到"PPT背景替换工具"
4. 拖到废纸篓
```

### Q5: PKG和DMG可以同时提供吗？

**可以！而且推荐这么做：**

```bash
# 一键创建所有格式
./一键打包Mac.sh

# 会得到：
dist/
├── PPT背景替换工具.app
├── PPT背景替换工具_v1.2.0.dmg   # 推荐给普通用户
└── PPT背景替换工具_v1.2.0.pkg   # 推荐给企业用户
```

---

## 📤 分发建议

### 推荐的分发策略

**在下载页面提供两个选项：**

```
📥 下载 PPT背景替换工具

推荐下载：
┌─────────────────────────────────────┐
│ 💎 DMG安装包（推荐）                 │
│ 文件大小：75 MB                      │
│ 适合：所有Mac用户                    │
│ [下载 DMG]                          │
└─────────────────────────────────────┘

企业用户：
┌─────────────────────────────────────┐
│ 🏢 PKG安装包                        │
│ 文件大小：85 MB                      │
│ 适合：IT管理员、批量部署             │
│ [下载 PKG]                          │
└─────────────────────────────────────┘
```

### 说明文档

**为PKG用户提供说明：**

```markdown
## PKG 安装说明

1. 双击下载的 .pkg 文件
2. 按照安装向导提示操作
3. 点击"继续" → "安装"
4. 输入Mac管理员密码
5. 等待安装完成
6. 在"应用程序"文件夹中找到应用

注意：
- 安装需要管理员权限
- 自动安装到 /Applications 目录
- 如需卸载，在应用程序文件夹中删除即可
```

---

## 🎓 完整工作流程示例

```bash
# === 在Mac电脑上执行 ===

# 1. 准备环境
cd ~/Downloads/ppt
pip3 install pyinstaller

# 2. 一键打包所有格式（推荐）
chmod +x 一键打包Mac.sh
./一键打包Mac.sh

# 等待几分钟...

# 3. 查看结果
ls -lh dist/

# 输出：
# PPT背景替换工具.app
# PPT背景替换工具_v1.2.0.dmg    ← 分发给普通用户
# PPT背景替换工具_v1.2.0.pkg    ← 分发给企业用户

# 4. 测试PKG
open "dist/PPT背景替换工具_v1.2.0.pkg"

# 5. 上传到网盘或GitHub Releases
# 完成！
```

---

## 🔗 相关资源

- PKG创建脚本：`create_pkg.sh`
- 一键打包脚本：`一键打包Mac.sh`
- DMG创建指南：`Mac打包完整指南.md`
- 应用打包配置：`build_mac_app.spec`

---

## 📊 总结

| 需求 | 推荐方案 |
|------|---------|
| **快速创建PKG** | 运行 `./一键打包Mac.sh` |
| **仅创建PKG** | 运行 `./create_pkg.sh` |
| **普通用户分发** | 优先提供 DMG |
| **企业用户分发** | 优先提供 PKG |
| **最佳实践** | 同时提供 DMG 和 PKG |

---

**版本:** v1.0  
**更新日期:** 2025-11-02

**提示：大多数情况下，DMG更受Mac用户欢迎，但PKG在企业环境中有独特优势！**

