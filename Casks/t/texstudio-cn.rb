cask "texstudio-cn" do
  arch arm: "-m1", intel: ""

  version "4.9.6"
  sha256 arm:   "bc24516fbe17d98fa5a2cc072834015c023fd42f1c0505a2baf14e616b5269b0",
         intel: "ada5b1cfef76252af83a6948c6927bdc152dc21f19a4997b4ac2ac3e4ccc2d31"

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
