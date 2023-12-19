cask "airy" do
  arch arm: "arm64", intel: "64"

  version "1.1.1"
  sha256 arm:   "95986d845466153e541b2d09bf8025fa8c612771b7b47e8a70c74c6b080d1416",
         intel: "5633656e9e78fe5590563ce59132320ef228708843f7ac368dd470f535acb8fb"

  url "https://electron-release-cdn.codefuture.top/download/flavor/Airy/latest/osx_#{arch}",
      verified: "electron-release-cdn.codefuture.top/"
  name "Airy"
  desc "AI 加持的聚焦搜索类工具"
  homepage "https://colink.in/"

  # livecheck do
  #   url
  #   strategy
  # end

  app "Airy.app"

  zap trash: [
    "~/Library/Logs/airy",
    "~/Library/Preferences/com.aloha.airy.plist",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.aloha.airy.sfl3",
    "~/Library/Saved Application State/com.aloha.airy.savedState",
    "~/Library/Application Support/airy",
  ]
end
