cask "texstudio-cn" do
  arch arm: "-m1"

  version "4.9.10"
  sha256 arm:   "9a780ba055b0e2296aa1ca45dd4e733bdd5ae4b28c7c000623777a2af9037a03",
         intel: "9449bad280c5ba45c81f3f0dbef330b00eb20b1e92dad00fd1ef29f36e2fdc1c"

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
