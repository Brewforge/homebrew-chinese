---
name: brewer
description: 维护 Homebrew cask 到 brewforge/chinese 仓库。触发场景：(1) 用户要求添加或更新 cask；(2) 用户提供上游 cask 文件 URL；(3) 用户提到将软件收录到 brewforge。
---

# Brewer

将上游 Homebrew cask 维护到 brewforge/chinese 仓库。仓库结构和规范见 CLAUDE.md。

## 流程

1. 获取上游信息
2. 计算 SHA256
3. 验证 App 元信息
4. 创建 Cask 文件（zap 留空）
5. 安装 App 并生成 zap
6. 检查与校正
7. 更新 README
8. 提交

## 1. 获取上游信息

- 读取用户提供的上游 cask 文件作为参考
- GitHub API 获取最新 release 版本号和资产文件名
- 检查 2-3 个历史版本确认文件命名规律稳定（确保 livecheck 可用）
- 验证下载 URL 返回 HTTP 200

## 2. 计算 SHA256

下载所有架构的安装包，用 `shasum -a 256` 计算哈希。

## 3. 验证 App 元信息

挂载 DMG 后：

```bash
# 确认 app 名称
ls /Volumes/*/

# Bundle ID 和最低系统版本
defaults read "/Volumes/.../App.app/Contents/Info" CFBundleIdentifier
defaults read "/Volumes/.../App.app/Contents/Info" LSMinimumSystemVersion

# 签名状态：ad-hoc/无签名 → 需要 preflight xattr -cr
codesign -dv "/Volumes/.../App.app"
```

**不要卸载 DMG**，步骤 5 需要用。

## 4. 创建 Cask 文件

路径 `Casks/{首字母}/{cask-name}.rb`，按 CLAUDE.md 格式编写。**zap 字段先留空。**

## 5. 安装 App 并生成 zap

直接使用 brew 安装 cask：

```bash
brew install {cask-name}
```

安装完成后提示用户运行一次软件，等待用户确认完成。

用户确认运行过软件后，生成 zap 字段：

```bash
brew tap nrlquaker/createzap   # 仅首次
brew createzap {cask-name}
```

将输出填入 cask 的 `zap` 字段。

## 6. 检查与校正

依次执行：

```bash
brew style --fix {cask-name}
brew audit --strict {cask-name}
brew lc --cask {cask-name}
```

**任何命令报错时，询问用户是否重试或跳过。不要自行决定跳过。**

## 7. 更新 README

- 在对应分类表格中按字母序插入新条目
- 徽章：`a.svg`=开源 `b.svg`=闭源 `1.svg`=免费 `2.svg`=买断 `3.svg`=订阅
- 检查是否有其他 cask 文件未列入 README，一并补充

## 8. 提交

单次 commit，格式：`{cask-name} {version}`
