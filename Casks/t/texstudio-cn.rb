cask "texstudio-cn" do
  arch arm: "-m1"

  version "4.9.8"
  sha256 arm:   "e66fd2a6305e88ac88d47deee3306f449d29b1f3a8e49f382fcaea2a79f29373",
         intel: "8c87cc80cd56af21663b3c7d9b411440e573d108724c01dce0d0e8c6db61dabc"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/texstudio/LatestRelease/texstudio-#{version}-osx#{arch}.zip"
  name "TeXstudio"
  desc "LaTeX editor"
  homepage "https://github.com/texstudio-org/texstudio/"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/texstudio/LatestRelease"
    regex(/texstudio-(\d+(\.\d+){2})-osx\.zip/i)
  end

  conflicts_with cask: "texstudio"
  depends_on macos: :ventura

  app "texstudio-#{version}-osx#{arch}.app"

  zap trash: [
    "~/.config/texstudio",
    "~/Library/Preferences/texstudio.plist",
    "~/Library/Saved Application State/texstudio.savedState",
  ]
end
