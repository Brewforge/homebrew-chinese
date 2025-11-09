cask "texstudio-cn" do
  arch arm: "-m1", intel: ""

  version "4.9.0"
  sha256 arm:   "4a28f080b4b725ef4f4c41cce8e49ee81793d24ffe6a82ba82f20625cc5969d6",
         intel: "09713189f5247f56fe745f0329b7574b3bc9c3aedb450f27ffd43e25ccc4337b"

  url "https://mirror.nju.edu.cn/github-release/texstudio-org/texstudio/LatestRelease/texstudio-#{version}-osx#{arch}.zip",
      verified: "mirror.nju.edu.cn/github-release/texstudio-org/"
  name "TeXstudio"
  desc "LaTeX editor"
  homepage "https://github.com/texstudio-org/texstudio/"

  livecheck do
    url "https://mirror.nju.edu.cn/github-release/texstudio-org/texstudio/LatestRelease"
    regex(/texstudio-(\d+(\.\d+){2})-osx\.zip/i)
  end

  auto_updates true
  conflicts_with cask: "texstudio"
  depends_on macos: ">= :ventura"

  app "texstudio-#{version}-osx#{arch}.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/texstudio",
    "~/.config/texstudio",
    "~/Library/Preferences/texstudio.plist",
    "~/Library/Saved Application State/texstudio.savedState",
  ]
end
