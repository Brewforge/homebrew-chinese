# Brewforge Chinese

Homebrew tap (`brewforge/chinese`)，为中国用户提供 cask 定义。

## 仓库结构

```text
Casks/{首字母}/{cask-name}.rb   # 所有 cask 文件按首字母分目录
assets/                         # README 用的 SVG 徽章
  a.svg = 开源, b.svg = 闭源
  1.svg = 免费, 2.svg = 买断, 3.svg = 订阅
```

## Cask 文件格式（字段顺序）

```ruby
cask "name" do
  arch arm: "...", intel: "..." # 多架构时

  version "x.y.z"
  sha256 arm: "...",
         intel: "..."

  url "..."
  name "显示名称"
  desc "描述"
  homepage "https://..."

  livecheck do
    "..."
  end            # GitHub 项目用 strategy :github_latest

  auto_updates true               # 如果 app 自更新

  depends_on macos: ">= :版本"
  app "AppName.app"

  preflight do                    # 未签名 app 需要
    system_command "xattr", args: ["-cr", "#{staged_path}/AppName.app"]
  end

  zap trash: [
    "...",
  ]
end
```

## 提交规范

- 新增/更新 cask + README 改动合并为一个 commit
- 格式：`cask-name version`，如 `macoptimizer 4.0.6`

## README 表格分类

- AI 工具、代理工具、通用软件、外语学习、开源软件镜像
- 揭榜区：有已知问题的 cask

## 开发者参考

- Discussion #1: `brew create --cask --set-name [名] --set-version [版本] --tap=brewforge/chinese [URL]`
- 检查：`brew style --fix [桶名]` / `brew audit --strict [桶名]` / `brew lc --cask [桶名]`
