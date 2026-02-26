---
name: brewer
description: 维护 Homebrew cask 到 brewforge/chinese 仓库。触发场景：(1) 用户要求添加或更新 cask；(2) 用户提供上游 cask 文件 URL；(3) 用户提到将软件收录到 brewforge。
---

# Brewer

将上游 Homebrew cask 维护到 brewforge/chinese 仓库。仓库结构和规范见 CLAUDE.md。

脚本位于 `.claude/scripts/`，出错时再手动介入。

## 流程

1. 获取上游信息 + 下载 + 元信息（脚本自动）
2. 创建 Cask 文件（zap 留空）
3. 安装 App 并生成 zap（需用户交互）
4. 检查与校正（脚本自动）
5. 更新 README + 提交

## 1. 获取上游信息 + 下载 + 元信息

### GitHub 项目

先用 `gh api` 确认版本命名规律：

```bash
gh api repos/{owner}/{repo}/releases --paginate \
  --jq '.[] | {tag: .tag_name, assets: [.assets[] | .name]}' | head -20
```

### 执行 inspect 脚本

对每个架构的 DMG/ZIP 运行：

```bash
.claude/scripts/brewer-inspect.sh <download_url> [arm|intel|universal]
```

脚本自动完成：下载 → SHA256 → 挂载/解压 → 提取 app_name / bundle_id / min_os / needs_xattr。

输出末尾的 `=== 汇总 ===` 包含所有需要的字段值。

**多架构时**对 arm 和 intel 各运行一次。

**脚本不会卸载 DMG**，后续步骤可能需要。

## 2. 创建 Cask 文件

路径 `Casks/{首字母}/{cask-name}.rb`，按 CLAUDE.md 格式编写。

根据 inspect 输出填写：
- `sha256` ← 脚本输出的 sha256
- `depends_on macos:` ← 脚本输出的 min_os（映射到符号名）
- `app` ← 脚本输出的 app_name
- `preflight xattr -cr` ← 仅当 needs_xattr=true
- `zap trash: []` ← **先留空**

macOS 版本映射：12→monterey, 13→ventura, 14→sonoma, 15→sequoia

## 3. 安装 App 并生成 zap

```bash
brew install {cask-name}
```

安装完成后**提示用户运行一次软件**，等待用户确认。

用户确认后：

```bash
brew tap nrlquaker/createzap   # 仅首次
brew createzap {cask-name}
```

将输出填入 cask 的 `zap` 字段。

## 4. 检查与校正

```bash
.claude/scripts/brewer-check.sh {cask-name}
```

脚本依次执行 `brew style --fix` → `brew audit --strict` → `brew lc --cask`。

**任何命令报错时，询问用户是否重试或跳过。不要自行决定跳过。**

## 5. 更新 README + 提交

**每个软件都必须更新 README 并立即 commit，不要跳过 README，不要攒多个软件一起提交。**

- 在对应分类表格中按字母序插入新条目
- 徽章：`a.svg`=开源 `b.svg`=闭源 `1.svg`=免费 `2.svg`=买断 `3.svg`=订阅
- 检查是否有其他 cask 文件未列入 README，一并补充
- rb 文件和 README 改动合并为**单次 commit**，格式：`{cask-name} {version}`
