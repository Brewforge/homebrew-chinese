cask "iina-cn" do
  version "1.4.2"
  sha256 "2e0fd89fbba1c92a6c115171e5b51904883bb497fbe513a6961d080fbab08ff6"

  url "https://mirrors.tuna.tsinghua.edu.cn/iina/IINA.v#{version}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/iina/"
  name "IINA"
  desc "Free and open-source media player"
  homepage "https://iina.io/"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/iina"
    regex(/IINA\.v(\d+(\.\d+)+)\.dmg/i)
  end

  auto_updates true
  conflicts_with cask: "iina"
  depends_on macos: ">= :big_sur"

  app "IINA.app"
  binary "#{appdir}/IINA.app/Contents/MacOS/iina-cli", target: "iina"

  zap trash: [
    "~/Library/Application Scripts/com.colliderli.iina.OpenInIINA",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.colliderli.iina.sfl*",
    "~/Library/Application Support/com.colliderli.iina",
    "~/Library/Application Support/CrashReporter/IINA*.plist",
    "~/Library/Caches/com.colliderli.iina",
    "~/Library/Containers/com.colliderli.iina.OpenInIINA",
    "~/Library/Cookies/com.colliderli.iina.binarycookies",
    "~/Library/HTTPStorages/com.colliderli.iina",
    "~/Library/Logs/com.colliderli.iina",
    "~/Library/Logs/DiagnosticReports/IINA*.crash",
    "~/Library/Preferences/com.colliderli.iina.plist",
    "~/Library/Safari/Extensions/Open in IINA*.safariextz",
    "~/Library/Saved Application State/com.colliderli.iina.savedState",
    "~/Library/WebKit/com.colliderli.iina",
  ]
end
