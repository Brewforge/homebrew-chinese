cask "m3u8-downloader" do
  arch arm: "arm64", intel: "x64"

  version "2.0.7"
  sha256 arm:   "ac5ad32fe771ad09539f3dadfec65ff5b956de76316774f87b2abc6901d4c103",
         intel: "033e5383fec82327196d8a58834a50f95a37d2e4dde9f397cdd34317a2a7d8d7"

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
