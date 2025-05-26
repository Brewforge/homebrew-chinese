cask "easytier-gui" do
  arch arm: "aarch64", intel: "x64"

  version "2.3.0"
  sha256 arm:   "5b47f1261bc7ffc24f8636fc0fd6d052d732618c76360c37a2d0dc47157e700f",
         intel: "713c04240f91ddbfbf18ce7e483931d69ff9f86aa9788502c7e6007ce6656f72"

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
