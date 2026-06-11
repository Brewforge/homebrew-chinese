cask "texstudio-cn" do
  arch arm: "-m1", intel: ""

  version "4.9.5"
  sha256 arm:   "714846c3b4da8339e7128f476bbaf9f41378a21fd68f09476b027562f03ffce9",
         intel: "975d052a0e01c21a4a55007248834335357977d7dc3773c5fd91be8eba7f73eb"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/texstudio/LatestRelease/texstudio-#{version}-osx#{arch}.zip",
      verified: "mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/"
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
