cask "texstudio-cn" do
  arch arm: "-m1", intel: ""

  version "4.8.8"
  sha256 arm:   "d60619d3cf4ec8195c7c0c1f890879d72aacaac6149f6f4179c9fab952ca487a",
         intel: "77e13a73e001c6528e1235429fa23f3858c35ae8b276b0621e09c8503aa3eb5a"

  url "https://mirrors.bfsu.edu.cn/github-release/texstudio-org/texstudio/LatestRelease/texstudio-#{version}-osx#{arch}.zip",
      verified: "mirrors.bfsu.edu.cn/github-release/texstudio-org/"
  name "TeXstudio"
  desc "LaTeX editor"
  homepage "https://github.com/texstudio-org/texstudio/"

  livecheck do
    url "https://mirrors.bfsu.edu.cn/github-release/texstudio-org/texstudio/LatestRelease"
    regex(/texstudio-(\d+(\.\d+){2})-osx\.zip/i)
  end

  auto_updates true
  conflicts_with cask: "texstudio"
  depends_on macos: ">= :big_sur"

  app "texstudio-#{version}-osx#{arch}.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/texstudio",
    "~/.config/texstudio",
    "~/Library/Preferences/texstudio.plist",
    "~/Library/Saved Application State/texstudio.savedState",
  ]
end
