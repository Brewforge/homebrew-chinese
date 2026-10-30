cask "texstudio-cn" do
  arch arm: "-m1"

  version "4.9.9"
  sha256 arm:   "6e1814b234fc6a018fcca62f847f95badd2437bfb2baddcffab3d430ac861f46",
         intel: "485e79c6d7ceb588002ba33ea1bbc9513352fcdd22f27a75704bb54a344de176"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/texstudio/LatestRelease/texstudio-#{version}-osx#{arch}.zip"
  name "TeXstudio"
  desc "LaTeX editor"
  homepage "https://github.com/texstudio-org/texstudio/"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/texstudio/LatestRelease"
    regex(/texstudio-(\d+(\.\d+){2})-osx\.zip/i)
  end

  conflicts_with cask: "texstudio"
  depends_on macos: :sonoma

  app "texstudio-#{version}-osx#{arch}.app"

  zap trash: [
    "~/.config/texstudio",
    "~/Library/Preferences/texstudio.plist",
    "~/Library/Saved Application State/texstudio.savedState",
  ]
end
