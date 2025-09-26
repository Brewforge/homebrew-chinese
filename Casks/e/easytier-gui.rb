cask "easytier-gui" do
  arch arm: "aarch64", intel: "x64"

  version "2.4.5"
  sha256 arm:   "6d95ed6b53cf1cce7229700fb47645d927c6092e5eddcfbf84be19b4ab5cd473",
         intel: "190356a80124f410483bb21b020387e726dd3bc7f91a84cb39d1200ad5d232aa"

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
