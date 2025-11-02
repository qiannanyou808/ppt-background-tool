# GitHub自动打包快速指南

## 🎯 目标
在Windows电脑上，通过GitHub Actions自动创建Mac的PKG安装包

## ⏱️ 预计时间
首次配置：15分钟 | 后续使用：2分钟

---

## 📋 准备工作

### 需要：
- ✅ GitHub账号（免费）
- ✅ Git已安装（Windows）
- ✅ 项目源代码

### 不需要：
- ❌ Mac电脑
- ❌ 付费服务
- ❌ 复杂配置

---

## 🚀 5步完成配置

### 步骤1: 安装Git（如果还没有）

```powershell
# 在Windows PowerShell中检查
git --version

# 如果没有，下载安装：
# https://git-scm.com/download/win
```

### 步骤2: 初始化Git仓库

```powershell
# 进入项目目录
cd d:\code-new\ppt

# 初始化
git init

# 添加所有文件
git add .

# 第一次提交
git commit -m "Initial commit"
```

### 步骤3: 在GitHub创建仓库

1. 打开 https://github.com
2. 点击右上角 **+** → **New repository**
3. 填写：
   - Repository name: `ppt-background-tool`
   - 选择 **Public**（免费使用Actions）
4. 点击 **Create repository**

### 步骤4: 推送代码到GitHub

```powershell
# 关联远程仓库（替换成你的用户名）
git remote add origin https://github.com/你的用户名/ppt-background-tool.git

# 推送
git branch -M main
git push -u origin main
```

### 步骤5: 触发自动构建

**方法A: 手动触发（推荐首次使用）**

1. 进入GitHub仓库页面
2. 点击 **Actions** 标签
3. 选择 **Build Mac Packages**
4. 点击 **Run workflow** → **Run workflow**
5. 等待5-10分钟

**方法B: 推送标签自动触发**

```powershell
# 创建版本标签
git tag v1.0.0

# 推送标签（自动触发构建）
git push origin v1.0.0
```

---

## 📥 下载构建结果

### 方法1: 从Actions下载

1. 进入 **Actions** 页面
2. 点击最新的构建任务
3. 滚动到底部 **Artifacts** 区域
4. 下载 **mac-installers.zip**
5. 解压得到：
   - ✅ `PPT背景替换工具.app`
   - ✅ `PPT背景替换工具_v1.2.0.dmg`
   - ✅ `PPT背景替换工具_v1.2.0.pkg`

### 方法2: 从Releases下载（推送tag后）

1. 进入 **Releases** 页面
2. 找到对应版本（如 v1.0.0）
3. 直接下载DMG和PKG

---

## 🎉 完成！

现在你已经有了Mac安装包，可以分发给用户了！

---

## 🔄 日常使用流程

```powershell
# 1. 修改代码
# （在Windows上正常开发）

# 2. 提交更改
git add .
git commit -m "更新功能"

# 3. 推送到GitHub
git push

# 4. 创建新版本（触发自动构建）
git tag v1.0.1
git push origin v1.0.1

# 5. 等待几分钟后，在Releases下载新版本
```

---

## 💡 工作流程图

```
Windows开发
    ↓
git push到GitHub
    ↓
GitHub Actions自动运行
    ↓
在Mac环境中打包
    ↓
上传DMG和PKG
    ↓
你在Windows下载
    ↓
分发给Mac用户
```

---

## ❓ 常见问题

### Q1: GitHub Actions免费吗？

**A:** 公开仓库完全免费，私有仓库每月2000分钟免费额度。

### Q2: 构建需要多长时间？

**A:** 通常5-10分钟，取决于项目大小。

### Q3: 如何查看构建日志？

**A:** Actions页面 → 点击任务 → 查看详细日志

### Q4: 构建失败怎么办？

**A:** 检查Actions日志中的错误信息，通常是依赖问题。

### Q5: 可以同时构建Windows版本吗？

**A:** 可以！修改工作流配置支持多平台构建。

---

## 🎓 下一步

- ✅ 配置完成后，每次推送tag自动构建
- ✅ 用户可以从Releases下载最新版本
- ✅ 完全自动化，无需手动操作

---

## 📚 相关文档

- 详细说明: `docs/在Windows上创建Mac安装包的方法.md`
- 工作流配置: `.github/workflows/build-mac.yml`
- Git忽略文件: `.gitignore`

---

**🎊 恭喜！你现在可以在Windows上为Mac用户创建安装包了！**

**关键点：** 不需要Mac电脑，完全免费，全自动化！

