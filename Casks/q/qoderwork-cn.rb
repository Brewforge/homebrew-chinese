cask "qoderwork-cn" do
  arch arm: "arm64", intel: "x64"

  version "0.6.1"
  sha256 :no_check

  url "https://static.qoder.com.cn/qoder-work-cn/releases/latest/QoderWorkCN-#{arch}.dmg"
  name "Qoder"
  desc "AI 驱动的智能编程平台"
  homepage "https://qoder.com.cn/qoderwork"

  livecheck do
    skip "No Infomation Available Found"
  end

  depends_on :macos

  app "QoderWork CN.app"

  zap trash: [
    "/Applications/QoderWork CN.app",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.qoder.work.cn.sfl*",
    "~/Library/Application Support/QoderWork CN",
    "~/Library/Logs/QoderWork CN",
    "~/Library/Preferences/com.qoder.work.cn.plist",
  ]
end
