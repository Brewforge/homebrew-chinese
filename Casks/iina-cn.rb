cask "iina-cn" do
  version "1.3.4"
  sha256 "7de50f5ad4a2fd5b27bf59a31b2060074c05331c7aafa533ad4adab65028d78c"

  url "https://mirrors.tuna.tsinghua.edu.cn/iina/IINA.v#{version}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/iina/"
  name "IINA"
  desc "Free and open-source media player"
  homepage "https://iina.io/"

  livecheck do
    url "https://www.iina.io/appcast.xml"
    strategy :sparkle, &:short_version # IINA sometimes rebuilds with the same short version.
  end

  auto_updates true
  conflicts_with cask: "iina"
  depends_on macos: ">= :el_capitan"

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
