cask "easytier-gui" do
  arch arm: "aarch64", intel: "x64"

  version "2.3.2"
  sha256 arm:   "54607696e29570eab375d6205dafa6c73e1f3850ad0f3ad39e3e114097eda6f8",
         intel: "b2b28b0e7b0e3b4893133b9a46932a6efbc9da2968682b0b173074ae4a9702c2"

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
