cask "texstudio-cn" do
  arch arm: "-m1", intel: ""

  version "4.9.1"
  sha256 arm:   "53eeb9b6c2f394fe14c8166aa720ed2b355a00a2304c88ddd855d485653208ab",
         intel: "5e28f4f3986d8e984271bcec04161c9eebc7ceb34ac923c7f0baa0ac0b63921b"

  url "https://mirror.lzu.edu.cn/github-release/texstudio-org/texstudio/LatestRelease/texstudio-#{version}-osx#{arch}.zip",
      verified: "mirror.lzu.edu.cn/github-release/texstudio-org/"
  name "TeXstudio"
  desc "LaTeX editor"
  homepage "https://github.com/texstudio-org/texstudio/"

  livecheck do
    url "https://mirror.lzu.edu.cn/github-release/texstudio-org/texstudio/LatestRelease"
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
