# Homebrew-Chinese

<!-- markdownlint-disable MD033 -->

![Homebrew](https://img.shields.io/badge/-Homebrew-FBB040?labelColor=555555&logoColor=FFFFFF&logo=homebrew) ![CI](https://github.com/Brewforge/homebrew-chinese/actions/workflows/schedule.yml/badge.svg) ![license](https://img.shields.io/github/license/Brewforge/homebrew-chinese) ![code-size](https://img.shields.io/github/languages/code-size/Brewforge/homebrew-chinese) ![repo-size](https://img.shields.io/github/repo-size/Brewforge/homebrew-chinese)

一个致力于为中国用户提供 [🍺 Homebrew](https://github.com/Homebrew/brew) 支持的中文库

本仓库收录：

- [x] 开源软件的中文版镜像
- [x] 面向中国用户的未被官方库收录的软件
- [x] 面向中国用户的国产商业软件

👏 欢迎参与[仓库建设讨论](https://github.com/orgs/Brewforge/discussions) 🎙️

## 🍺 用起来

### 📝 太长不看

🙋‍♂️ 为什么会有本仓库

- 部分软件因为未签名而未能被官方库收录
<!-- - 💪 国内用户访问 [Homebrew](https://github.com/Homebrew) 官方仓库比较费劲 -->
<!-- - 🪜 下载过程流量消耗比较多，本仓库对通过 GitHub 发布内容使用 [GitHub Proxy](https://mirror.ghproxy.com) 进行加速 -->

### 🏃 准备

- 🪜 流量有限：🍺 HomebrewCN [Homebrew 国内安装脚本 | Gitee](https://gitee.com/cunkai/HomebrewCN) 🚴

> 该脚本自动配置了国内源，源码在 Gitee 开源，🍺 HomebrewCN 作者也写了 [常见错误的解决办法](https://gitee.com/cunkai/HomebrewCN/blob/master/error.md) 。

```sh
/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
```

- 🪜 流量无限：[Homebrew 官方安装脚本](https://brew.sh/zh-cn/)

```sh
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### 🚀 使用

🚰 把本仓库和 [brewforge/extras](https://github.com/Brewforge/homebrew-extras) **拍** 到自己 Mac 上（仅需初次）

- 🪜 流量有限：

```bash
brew tap brewforge/chinese https://mirror.ghproxy.com/https://github.com/Brewforge/homebrew-chinese
brew tap brewforge/extras https://mirror.ghproxy.com/https://github.com/Brewforge/homebrew-extras
```

- 🪜 流量无限：

```bash
brew tap brewforge/chinese
brew tap brewforge/extras
```

🔍 搜索

```sh
brew search <cask>
```

🛒 安装

```sh
brew install --cask <cask>
```

🗑️ 卸载

```sh
brew rm <cask>
```

🧾 列出已安装的软件

```sh
brew ls
```

🙏 更多帮助

```sh
brew help
```

## 🀄️ 列表

> 本列表中没有的软件，可以在下面列表中查看
>
> [![点击前往 面向全球](https://img.shields.io/badge/%E9%9D%A2%E5%90%91%E5%85%A8%E7%90%83-blue?style=for-the-badge&logo=homebrew&label=点击前往)](https://github.com/Brewforge/homebrew-extras)
> [![点击前往 命令行](https://img.shields.io/badge/命令行-blue?style=for-the-badge&logo=homebrew&label=点击前往)](https://github.com/Brewforge/homebrew-more)

### AI 工具

|      桶名       |                          软件官网                           |                 备注                 |
| :-------------: | :---------------------------------------------------------: | :----------------------------------: |
|     `aidea`     |                [aidea](https://ai.aicode.cc)                | ![b](assets/b.svg)![2](assets/2.svg) |
|   `autotyper`   |     [AutoTyper](https://autoglm.zhipuai.cn/autotyper/)      | ![b](assets/b.svg)![1](assets/1.svg) |
| `cockpit-tools` | [cockpit-tools](https://github.com/jlcodes99/cockpit-tools) | ![a](assets/a.svg)![1](assets/1.svg) |

### 代理工具

|       桶名        |                              软件官网                               |                 备注                 |
| :---------------: | :-----------------------------------------------------------------: | :----------------------------------: |
|   `clashx-meta`   |       [Clashx.Meta](https://github.com/MetaCubeX/ClashX.Meta)       | ![a](assets/a.svg)![1](assets/1.svg) |
| `clash-nyanpasu`  |          [Clash-Nyanpasu](https://github.com/libnyanpasu)           | ![a](assets/a.svg)![1](assets/1.svg) |
|     `flclash`     |           [FlClash](https://github.com/chen08209/FlClash)           | ![a](assets/a.svg)![1](assets/1.svg) |
| `gui-for-singbox` | [GUI.for.SingBox](https://github.com/GUI-for-Cores/GUI.for.SingBox) | ![a](assets/a.svg)![1](assets/1.svg) |
|     `sparkle`     |          [Sparkle](https://github.com/xishang0128/sparkle)          | ![a](assets/a.svg)![1](assets/1.svg) |
|     `throne`      |           [Throne](https://github.com/throneproj/Throne)            | ![a](assets/a.svg)![1](assets/1.svg) |
|     `v2rayn`      |              [v2rayN](https://github.com/2dust/v2rayN)              | ![a](assets/a.svg)![1](assets/1.svg) |
|     `v2rayxs`     |             [V2RayXS](https://github.com/tzmax/V2RayXS)             | ![a](assets/a.svg)![1](assets/1.svg) |

### 通用软件

|        桶名        |                             软件官网                             |                                   备注                                   |
| :----------------: | :--------------------------------------------------------------: | :----------------------------------------------------------------------: |
|   `alist-helper`   |    [Alist-Helper](https://github.com/Xmarmalade/alisthelper)     |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|    `bilitools`     |            [BiliTools](https://btjawa.top/bilitools/)            |                   ![a](assets/b.svg)![1](assets/1.svg)                   |
|    `cajviewer`     |      [CAJViewer](https://CAJViewer.cnki.net/download.html)       |                   ![b](assets/b.svg)![1](assets/1.svg)                   |
| `chaoxing-cxstudy` |               [学习通](https://app.chaoxing.com/)                |                   ![b](assets/b.svg)![1](assets/1.svg)                   |
|  `cloud-uploader`  | [网易云音乐上传助手](https://github.com/lulu-ls/cloud-uploader)  |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|     `copybook`     |       [字帖生成器](https://github.com/xxNull-lsk/Copybook)       |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|    `douyin-ar`     |                [像塑](https://effect.douyin.com/)                |                   ![b](assets/b.svg)![1](assets/1.svg)                   |
|     `downkyi`      |     [哔哩下载姬](https://github.com/yaobiao131/downkyicore/)     |                   ![a](assets/b.svg)![1](assets/1.svg)                   |
|     `esearch`      |            [eSearch](https://esearch-app.netlify.app)            |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|     `e-study`      |               [知网研学](https://estudy.cnki.net/)               |          ![b](assets/b.svg)![1](assets/1.svg)![3](assets/3.svg)          |
|    `easy-to-tv`    |     [Easy To TV](https://github.com/duolabmeng6/easy_to_tv)      |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|    `easyspider`    |               [EasySpider](https://easyspider.net)               |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|   `easytier-gui`   |               [EasyTier-GUI](https://easytier.cn/)               |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|    `edrawmax@9`    |                [亿图图示 9](http://edrawsoft.cn)                 |                   ![b](assets/b.svg)![1](assets/1.svg)                   |
|     `feeluown`     |           [FeelUOwn](http://feeluown.readthedocs.io/)            |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|      `flowus`      |                   [FlowUs](https://flowus.cn/)                   |          ![b](assets/b.svg)![1](assets/1.svg)![3](assets/3.svg)          |
|     `i4tools`      |                    [爱思助手](https://i4.cn)                     |                   ![b](assets/b.svg)![1](assets/1.svg)                   |
|    `keyviz-cn`     |         [Keyviz-cn](https://github.com/zetaloop/keyviz/)         |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|     `lingquan`     |                  [零泉](https://lingquan.cool/)                  |          ![b](assets/b.svg)![1](assets/1.svg)![3](assets/3.svg)          |
| `m3u8-downloader`  | [M3U8-Downloader](https://github.com/HeiSir2014/M3U8-Downloader) |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|   `macoptimizer`   |     [Mac优化大师](https://github.com/ddlmanus/MacOptimizer)      |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|     `mastergo`     |                 [MasterGo](https://mastergo.com)                 |                   ![b](assets/b.svg)![1](assets/1.svg)                   |
|     `messauto`     |         [MessAuto](https://github.com/LeeeSe/MessAuto/)          |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|      `noteey`      |                  [Noteey](https://noteey.com/)                   | ![b](assets/b.svg)![1](assets/1.svg)![2](assets/2.svg)![3](assets/3.svg) |
|  `project-graph`   |    [Project Graph](https://github.com/graphif/project-graph)     |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|      `presto`      |          [Presto](https://github.com/Presto-io/Presto)           |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
| `quarkclouddrive`  |                 [夸克网盘](https://pan.quark.cn)                 |                   ![b](assets/b.svg)![1](assets/1.svg)                   |
|  `splayer-imsyy`   |           [SPlayer](https://github.com/imsyy/SPlayer)            |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|   `tts-vue-next`   |       [TTS-Vue-Next](https://tts-doc.loker.vip/home.html)        |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|     `tiny-rdm`     |             [Tiny RDM](https://redis.tinycraft.cc/)              |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|    `vibeviewer`    |       [Vibeviewer](https://github.com/MarveleE/Vibeviewer)       |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|     `wiliwili`     |        [wiliwili](https://xfangfang.github.io/wiliwili/)         |                   ![a](assets/a.svg)![1](assets/1.svg)                   |
|    `yank-note`     |             [Yank-Note](https://yank-note.com/zh-CN)             | ![a](assets/a.svg)![1](assets/1.svg)![2](assets/2.svg)![3](assets/3.svg) |

### 外语学习

|     桶名      |                        软件官网                         |                          备注                          |
| :-----------: | :-----------------------------------------------------: | :----------------------------------------------------: |
| `dashplayer`  | [dashplayer](https://github.com/solidSpoon/DashPlayer)  | ![a](assets/a.svg)![1](assets/1.svg)![3](assets/3.svg) |
|    `enjoy`    |      [人人都能学英语](https://1000h.org/enjoy-app)      | ![b](assets/b.svg)![2](assets/2.svg)![3](assets/3.svg) |
|  `eudic-cn`   |    [欧路词典](https://www.eudic.net/v4/en/app/eudic)    | ![b](assets/b.svg)![1](assets/1.svg)![2](assets/2.svg) |
| `dehelper-cn` |    [德语助手](https://eudic.net/v4/de/app/dehelper)     | ![b](assets/b.svg)![1](assets/1.svg)![2](assets/2.svg) |
| `eshelper-cn` |    [西语助手](https://eudic.net/v4/es/app/eshelper)     | ![b](assets/b.svg)![1](assets/1.svg)![2](assets/2.svg) |
| `frhelper-cn` |    [法语助手](https://eudic.net/v4/fr/app/frhelper)     | ![b](assets/b.svg)![1](assets/1.svg)![2](assets/2.svg) |
|   `ting-de`   | [每日德语听力](http://francochinois.com/v4/en/app/ting) | ![b](assets/b.svg)![2](assets/2.svg)![3](assets/3.svg) |
|   `ting-en`   | [每日英语听力](http://francochinois.com/v4/en/app/ting) | ![b](assets/b.svg)![2](assets/2.svg)![3](assets/3.svg) |
|   `ting-es`   | [每日西语听力](http://francochinois.com/v4/es/app/ting) | ![b](assets/b.svg)![2](assets/2.svg)![3](assets/3.svg) |
|   `ting-fr`   | [每日法语听力](http://francochinois.com/v4/fr/app/ting) | ![b](assets/b.svg)![2](assets/2.svg)![3](assets/3.svg) |

### 开源软件镜像

|       桶名       |                             软件官网                              |                 备注                 |
| :--------------: | :---------------------------------------------------------------: | :----------------------------------: |
|   `blender-cn`   |                [Blender 镜像](https://blender.org)                | ![a](assets/a.svg)![1](assets/1.svg) |
| `blender@lts-cn` |              [Blender LTS 镜像](https://blender.org)              | ![a](assets/a.svg)![1](assets/1.svg) |
|   `dbeaver-cn`   |                [DBeaver 镜像](https://dbeaver.io)                 | ![a](assets/a.svg)![1](assets/1.svg) |
|    `gimp-cn`     |                   [GIMP 镜像](https://gimp.org)                   | ![a](assets/a.svg)![1](assets/1.svg) |
|    `iina-cn`     |                   [IINA 镜像](https://iina.io)                    | ![a](assets/a.svg)![1](assets/1.svg) |
|  `inkscape-cn`   | [Inkscape 镜像](https://inkscape.org/zh-hans/?switchlang=zh-hans) | ![a](assets/a.svg)![1](assets/1.svg) |
|    `julia-cn`    |                [Julia 镜像](https://julialang.org)                | ![a](assets/a.svg)![1](assets/1.svg) |
|  `julia@lts-cn`  |              [Julia LTS 镜像](https://julialang.org)              | ![a](assets/a.svg)![1](assets/1.svg) |
|    `kicad-cn`    |                  [Kicad 镜像](https://kicad.org)                  | ![a](assets/a.svg)![1](assets/1.svg) |
|     `lyx-cn`     |                    [Lyx 镜像](https://lyx.org)                    | ![a](assets/a.svg)![1](assets/1.svg) |
|  `miniforge-cn`  |    [Miniforge 镜像](https://github.com/conda-forge/miniforge)     | ![a](assets/a.svg)![1](assets/1.svg) |
|    `mogan-cn`    |                  [Mogan 镜像](https://mogan.app)                  | ![a](assets/a.svg)![1](assets/1.svg) |
|     `obs-cn`     |          [OBS Studio 镜像](https://obsproject.com/zh-cn)          | ![a](assets/a.svg)![1](assets/1.svg) |
| `qt-creator-cn`  |            [Qt Creator 镜像](https://qt.io/developers)            | ![a](assets/a.svg)![1](assets/1.svg) |
|  `texstudio-cn`  |              [TeXStudio 镜像](https://texstudio.org)              | ![a](assets/a.svg)![1](assets/1.svg) |
|  `sagemath-cn`   |               [SageMath 镜像](https://sagemath.org)               | ![a](assets/a.svg)![1](assets/1.svg) |
|     `vlc-cn`     |               [VLC 镜像](https://videolan.org/vlc)                | ![a](assets/a.svg)![1](assets/1.svg) |

## ✨ 一起维护

请直接发起 [拉取请求](https://github.com/Brewforge/homebrew-chinese/compare) 或 [工单](https://github.com/Brewforge/homebrew-chinese/issues/new/choose) 。

如希望成为仓库维护者，可提 issue。

## ⚔️ 揭榜

目前还有一些当前维护者未能搞定的 Cask，请各位豪杰出手相助。

|    桶名     |              软件官网              |        问题        |
| :---------: | :--------------------------------: | :----------------: |
| `capcut-cn` |  [剪映中文版](https://capcut.cn/)  |   未找到版本信息   |
|  `landrop`  |  [LANDrop](https://landrop.app/)   | 嵌套标签，难以选择 |
| `linkease`  | [易有云](https://app.linkease.com) | 多个结果，无法选中 |

---

> 本列表中没有的软件，可以在下面列表中查看
>
> [![点击前往 面向全球](https://img.shields.io/badge/%E9%9D%A2%E5%90%91%E5%85%A8%E7%90%83-blue?style=for-the-badge&logo=homebrew&label=点击前往)](https://github.com/Brewforge/homebrew-extras)
> [![点击前往 命令行](https://img.shields.io/badge/命令行-blue?style=for-the-badge&logo=homebrew&label=点击前往)](https://github.com/Brewforge/homebrew-more)

## 🌟 欢迎加星

[![星标](https://starchart.cc/Brewforge/homebrew-chinese.svg?variant=adaptive)](https://starchart.cc/Brewforge/homebrew-chinese)

<!-- ## ❤️ 赞助者 -->
