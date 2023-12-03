cask "texstudio-cn" do
  version "4.7.0"
  sha256 "92971b409b84158a8aa1cbe2cc4ad71a3fe5dee2aa65506fbf57d90461cd2918"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/texstudio/LatestRelease/texstudio-#{version}-osx.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/"
  name "TeXstudio"
  desc "LaTeX editor"
  homepage "https://texstudio.org/"

  livecheck do
    url "https://github.com/texstudio-org/texstudio/"
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "texstudio"
  depends_on macos: ">= :big_sur"
  app "texstudio.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/texstudio.sfl*",
    "~/Library/Preferences/texstudio.plist",
    "~/Library/Saved Application State/texstudio.savedState",
  ]
end
