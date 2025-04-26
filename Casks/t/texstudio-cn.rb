cask "texstudio-cn" do
  arch arm: "-m1", intel: ""

  version "4.8.7"
  sha256 arm:   "73c7195d4ae56bf1b5757012cff3b87ccce885c427c1233c2d584b641172a023",
         intel: "4f325c3bf10e0f63e8b4fb46d5c2a7362060dbfbae63148af49ae337b780f752"

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
