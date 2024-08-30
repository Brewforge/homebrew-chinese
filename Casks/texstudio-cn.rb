cask "texstudio-cn" do
  version "4.8.1"
  sha256 "9e547180b3013624a61ea5dbc92deac64ed6573d217f6044ccdf0b442932d513"

  url "https://mirrors.bfsu.edu.cn/github-release/texstudio-org/texstudio/LatestRelease/texstudio-#{version}-osx.dmg",
      verified: "mirrors.bfsu.edu.cn/github-release/texstudio-org/"
  name "TeXstudio"
  desc "LaTeX editor"
  homepage "https://github.com/texstudio-org/texstudio/"

  livecheck do
    url "https://mirrors.bfsu.edu.cn/github-release/texstudio-org/texstudio/LatestRelease"
    regex(/texstudio-(\d+(\.\d+){2})-osx\.dmg/i)
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

  caveats do
    requires_rosetta
  end
end
