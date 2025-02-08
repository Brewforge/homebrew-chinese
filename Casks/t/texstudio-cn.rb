cask "texstudio-cn" do
  arch arm: "-m1", intel: ""

  version "4.8.6"
  sha256 arm:   "3ba37f5bbf1232af5bdefbca7b859639c09b180aba26b2801119708f402b5c4a",
         intel: "7d4326f2e4a59cc7022d950f1c7f01ce1978bc69c66a7199b4c73ac2cca37b37"

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
