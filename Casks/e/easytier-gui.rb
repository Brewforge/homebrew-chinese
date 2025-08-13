cask "easytier-gui" do
  arch arm: "aarch64", intel: "x64"

  version "2.4.2"
  sha256 arm:   "1a3b0762f9a899502b604195402c8576524bf931ca82fdef04348e5d4a764c0d",
         intel: "bc46c8bf8b71c71b7e5e6405bc6432ddceabbcd56a7923610848eb903c851cb1"

  url "https://github.com/EasyTier/EasyTier/releases/download/v#{version}/easytier-gui_#{version}_#{arch}.dmg",
      verified: "github.com/EasyTier/EasyTier/"
  name "EasyTier"
  desc "简单、安全、去中心化的内网穿透 VPN 组网方案"
  homepage "https://easytier.cn/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "easytier-gui.app"

  zap trash: [
    "~/Library/Caches/com.kkrainbow.easytier",
    "~/Library/Logs/com.kkrainbow.easytier",
    "~/Library/Saved Application State/com.kkrainbow.easytier.savedState",
    "~/Library/WebKit/com.kkrainbow.easytier",
  ]
end
