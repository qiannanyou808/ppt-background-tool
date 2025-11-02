# -*- mode: python ; coding: utf-8 -*-
"""
PyInstaller配置文件 - Mac版本
用于将Python程序打包成独立的.app应用程序
无需用户安装Python环境
"""

import os
from pathlib import Path

block_cipher = None

# 应用程序名称
app_name = 'PPT背景替换工具'

# 分析依赖
a = Analysis(
    ['ppt_background_replacer.py'],
    pathex=[],
    binaries=[],
    datas=[],
    hiddenimports=[
        'PIL',
        'PIL._imagingtk',
        'PIL._tkinter_finder',
        'customtkinter',
        'pptx',
        'lxml',
        'lxml.etree',
    ],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[
        'matplotlib',
        'numpy',
        'pandas',
        'scipy',
        'pytest',
        'setuptools',
    ],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

# 打包为单个文件夹
pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name=app_name,
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=False,  # 不显示控制台窗口
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)

coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name=app_name,
)

# 创建.app包
app = BUNDLE(
    coll,
    name=f'{app_name}.app',
    icon=None,  # 如果有图标文件，在这里指定路径
    bundle_identifier='com.ppttools.background-replacer',
    version='1.2.0',
    info_plist={
        'NSPrincipalClass': 'NSApplication',
        'NSAppleScriptEnabled': False,
        'CFBundleName': app_name,
        'CFBundleDisplayName': app_name,
        'CFBundleGetInfoString': 'PPT背景替换工具 - 批量替换PPT背景图片',
        'CFBundleIdentifier': 'com.ppttools.background-replacer',
        'CFBundleVersion': '1.2.0',
        'CFBundleShortVersionString': '1.2.0',
        'NSHumanReadableCopyright': 'Copyright © 2025',
        'LSMinimumSystemVersion': '10.13.0',
        # 请求文件访问权限
        'NSDocumentsFolderUsageDescription': '需要访问文件夹以处理PPT文件',
        'NSDesktopFolderUsageDescription': '需要访问桌面以保存处理后的文件',
    },
)

