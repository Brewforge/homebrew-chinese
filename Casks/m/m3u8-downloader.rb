cask "m3u8-downloader" do
  arch arm: "arm64", intel: "x64"

  version "2.0.8"
  sha256 arm:   "f8033206742db927593d8d52fd289cbbcf3770f8eea66df047de40dadc836cd9",
         intel: "786d9c10157a3300c80297011cc52e989edcb053a78fb213e3369e5afd8a063a"

  url "https://github.com/HeiSir2014/M3U8-Downloader/releases/download/v#{version}/M3U8-Downloader-mac_#{arch}-#{version}.dmg"
  name "M3U8-Downloader"
  desc "Open-source M3U8 Downloader"
  homepage "https://github.com/HeiSir2014/M3U8-Downloader/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "M3U8-Downloader.app"

  zap trash: [
    "~/Library/Application Support/M3U8-Downloader",
    "~/Library/Caches/cn.heisir.m3u8-downloader-mac",
    "~/Library/Logs/M3U8-Downloader",
    "~/Library/Preferences/cn.heisir.m3u8-downloader-mac.plist",
    "~/Library/Saved Application State/cn.heisir.m3u8-downloader-mac.savedState",
  ]
end
