cask "texstudio-cn" do
  arch arm: "-m1", intel: ""

  version "4.9.4"
  sha256 arm:   "1e2920c48ab8c362ca89593040fc95900903ac3e8d5d23141c8ba8884cb4cc02",
         intel: "5cd63a059b23bffffcfac77c26c684e98d182407b9d7ba021d8a5e9285c485e2"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/texstudio/LatestRelease/texstudio-#{version}-osx#{arch}.zip",
      verified: "mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/"
  name "TeXstudio"
  desc "LaTeX editor"
  homepage "https://github.com/texstudio-org/texstudio/"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/texstudio/LatestRelease"
    regex(/texstudio-(\d+(\.\d+){2})-osx\.zip/i)
  end

  auto_updates true
  conflicts_with cask: "texstudio"
  depends_on macos: :ventura

  app "texstudio-#{version}-osx#{arch}.app"

  zap trash: [
    "~/.config/texstudio",
    "~/Library/Preferences/texstudio.plist",
    "~/Library/Saved Application State/texstudio.savedState",
  ]
end
