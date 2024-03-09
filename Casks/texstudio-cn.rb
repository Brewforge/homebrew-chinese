cask "texstudio-cn" do
  version "4.7.3"
  sha256 "ce1cd5ab82d907165e232dfc5ccf8329f086e375f4936c6b9da9b0091ddd0674"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/texstudio/LatestRelease/texstudio-#{version}-osx.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/"
  name "TeXstudio"
  desc "LaTeX editor"
  homepage "https://github.com/texstudio-org/texstudio/"

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
