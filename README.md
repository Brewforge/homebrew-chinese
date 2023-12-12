# Homebrew-Chinese

<!-- ![Homebrew](https://img.shields.io/badge/-Homebrew-FBB040?labelColor=555555&logoColor=FFFFFF&logo=homebrew) ![CI](https://github.com/Brewforge/homebrew-chinese/actions/workflows/main.yml/badge.svg) ![license](https://img.shields.io/github/license/Brewforge/homebrew-chinese) ![code-size](https://img.shields.io/github/languages/code-size/Brewforge/homebrew-chinese) ![repo-size](https://img.shields.io/github/repo-size/Brewforge/homebrew-chinese) -->

![Homebrew](https://img.shields.io/badge/-Homebrew-FBB040?labelColor=555555&logoColor=FFFFFF&logo=homebrew) ![license](https://img.shields.io/github/license/Brewforge/homebrew-chinese) ![code-size](https://img.shields.io/github/languages/code-size/Brewforge/homebrew-chinese) ![repo-size](https://img.shields.io/github/repo-size/Brewforge/homebrew-chinese)

一个致力于为中国用户提供 [🍺 Homebrew](https://github.com/Homebrew/brew) 支持的中文库

本仓库收录：

- [x] 开源软件的中文版镜像
- [x] 面向中国用户的未被官方库收录的软件
- [x] 面向中国用户的国产商业软件

⚠️ 本仓库的老顾客，请执行如下命令：

```bash
brew tap brewforge/homebrew-chinese
rm -rf $(brew --repository)/Library/Taps/ivaquero/homebrew-chinese
```

## 📝 太长不看

📦 收录列表

[![面向国人](https://img.shields.io/badge/%E9%9D%A2%E5%90%91%E5%9B%BD%E4%BA%BA-red?logo=homebrew&labelColor=555555)](./%E5%88%97%E8%A1%A8.md) [![面向全球](https://img.shields.io/badge/%E9%9D%A2%E5%90%91%E5%85%A8%E7%90%83-blue?logo=homebrew&labelColor=555555)](https://github.com/Brewforge/homebrew-extras/blob/main/list.md)

## 🏃 准备

- 🪜 流量有限：🍺 HomebrewCN [Homebrew 国内安装脚本 | Gitee](https://gitee.com/cunkai/HomebrewCN) 🚴

> 该脚本自动配置了国内源，源码在 Gitee 开源，🍺 HomebrewCN 作者也写了 [常见错误的解决办法](https://gitee.com/cunkai/HomebrewCN/blob/master/error.md) 。

```sh
/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
```

- 🪜 流量无限：[Homebrew 官方安装脚本](https://brew.sh/zh-cn/)

```sh
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## 🍺 使用

🚰 把本仓库和 [brewforge/extras](https://github.com/Brewforge/homebrew-extras) **拍** 到自己 Mac 上（仅需初次）

```bash
brew tap brewforge/chinese
brew tap brewforge/extras
```

🔍 搜索

```sh
brew search <formula 或 cask>
```

🛒 安装

```sh
brew install <formula>
brew install --cask <cask>
```

🗑️ 卸载

```sh
brew rm <formula 或 cask>
```

🧾 列出已安装的软件

```sh
brew ls
```

🙏 更多帮助

```sh
brew help
```

## ✨ 一起维护

请直接发起 [拉取请求](https://github.com/Brewforge/homebrew-chinese/compare) 或 [工单](https://github.com/Brewforge/homebrew-chinese/issues/new/choose) 。

### ⚔️ 揭榜

在 Experimental 文件夹中，还有一些当前维护者未能搞定的 Cask，请各位豪杰出手相助。

<!-- ## ❤️ 赞助者 -->
