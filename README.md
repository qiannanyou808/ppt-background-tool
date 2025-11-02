# PPT背景替换工具

一个简洁易用的Python桌面工具，用于批量替换PowerPoint演示文稿的背景图片。

> **最新版本 v1.2.0** - 智能背景识别系统！自动识别并删除各种形式的背景图片，包括横向/纵向撑满和大面积装饰图片！

## 功能特点

- ✅ 批量处理多个PPT文件
- ✅ 支持JPG、PNG格式的背景图片
- ✅ 完整保留原有文字、图片、图表等内容
- ✅ 现代化的图形界面
- ✅ 实时进度显示
- ✅ 支持中文路径和文件名
- ✅ 自动生成新文件（原文件名_新背景.pptx）

## 安装说明

### 方法一：直接运行Python脚本

1. 确保已安装Python 3.7或更高版本

2. 安装依赖包：
```bash
pip install -r requirements.txt
```

3. 运行程序：
```bash
python ppt_background_replacer.py
```

### 方法二：打包成EXE文件

#### 推荐方法（使用优化的打包脚本）：

**方式1：使用SPEC配置文件（推荐）**
```bash
双击 build_exe_spec.bat
```
这个脚本使用预配置的spec文件，能正确打包所有依赖。

**方式2：使用改进的BAT脚本**
```bash
双击 build_exe.bat
```
这个脚本包含了必要的隐藏导入参数。

#### 手动打包（不推荐，可能遇到依赖问题）：

1. 安装PyInstaller：
```bash
pip install pyinstaller
```

2. 使用SPEC文件打包：
```bash
pyinstaller ppt_background_replacer.spec --clean
```

3. 或使用命令行（带隐藏导入）：
```bash
pyinstaller --onefile --windowed --name "PPT背景替换工具" ^
    --hidden-import=customtkinter ^
    --hidden-import=PIL ^
    --collect-all customtkinter ^
    ppt_background_replacer.py
```

4. 打包完成后，在 `dist` 文件夹中找到生成的EXE文件

**清理临时文件：**
```bash
双击 clean.bat
```

## 使用说明

1. **启动程序**
   - 双击运行 `ppt_background_replacer.py` 或打包后的EXE文件

2. **选择PPT文件**
   - 点击"选择PPT文件"按钮
   - 可以选择一个或多个 `.pptx` 文件

3. **选择背景图片**
   - 点击"选择背景图片"按钮
   - 选择要设置为背景的图片（支持JPG、PNG格式）

4. **开始处理**
   - 点击"🚀 开始替换背景"按钮
   - 程序将批量处理所有选中的PPT文件
   - 状态框会显示实时进度

5. **查看结果**
   - 处理后的文件保存在原文件所在目录
   - 文件名格式：`原文件名_新背景.pptx`

## 技术说明

- **GUI框架：** CustomTkinter（现代化Tkinter）
- **PPT处理：** python-pptx
- **图像处理：** Pillow (PIL)
- **多线程：** 使用线程避免界面卡顿

## 注意事项

1. 仅支持 `.pptx` 格式（不支持旧版 `.ppt` 格式）
2. 背景图片会自动拉伸以适应幻灯片尺寸
3. 原始文件不会被修改，会生成新文件
4. 建议使用高分辨率图片作为背景，以获得最佳效果
5. 处理大量文件时请耐心等待

## 系统要求

- Windows 7/8/10/11
- Python 3.7+ (如果运行源码)
- 或直接运行打包的EXE文件（无需安装Python）

## 常见问题

**Q: 打包的EXE启动时提示"No module named 'customtkinter'"怎么办？**  
A: 这是因为PyInstaller没有正确识别customtkinter模块。解决方法：
   1. 先运行 `clean.bat` 清理旧文件
   2. 使用 `build_exe_spec.bat` 重新打包（推荐）
   3. 或使用 `build_exe.bat` 打包
   4. 不要使用简单的 `pyinstaller` 命令打包

**Q: 为什么打包的EXE文件很大（约80-150MB）？**  
A: PyInstaller会将Python解释器和所有依赖库（包括customtkinter、python-pptx等）打包进EXE，这是正常现象。

**Q: 可以处理包含动画的PPT吗？**  
A: 可以，所有动画效果都会保留。

**Q: 背景图片比例不对怎么办？**  
A: 程序会自动将图片拉伸至幻灯片尺寸，建议使用16:9或4:3比例的图片。

**Q: 中文路径会有问题吗？**  
A: 完全支持中文路径和文件名，放心使用。

**Q: 为什么打包需要这么久？**  
A: 第一次打包需要分析所有依赖，可能需要3-5分钟，请耐心等待。

## 许可证

本项目采用MIT许可证，可自由使用和修改。

## 更新日志

### v1.2.0 (2025-10-22)
- **智能背景识别**：新增智能识别系统
- 自动识别并删除各种形式的背景图片
- 支持识别：完全铺满、横向撑满、纵向撑满、大面积图片
- 三层检测机制：背景填充 + 母版背景 + 图片形状
- 详细的处理日志，显示每个被识别的背景

### v1.1.0 (2025-10-22)
- **重要修复**：修复背景图片覆盖内容的问题
- 使用XML直接操作，真正设置幻灯片背景
- 确保所有页面都被正确处理
- 完整保留所有文字、图片、图表等内容

### v1.0.0 (2025-10-22)
- 初始版本发布
- 支持批量替换PPT背景
- 现代化GUI界面
- 完整的进度显示

