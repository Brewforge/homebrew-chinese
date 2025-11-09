cask "texstudio-cn" do
  arch arm: "-m1", intel: ""

  version "4.8.9"
  sha256 arm:   "b39d5e764f491a5f5ed2d39647b46228f2cb455311c2389cd1ff47948f71c6d9",
         intel: "06091fab6ad8954c7f56486011041444f908c10722e68a6705be6f1f996fffa8"

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
