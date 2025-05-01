cask "easytier-gui" do
  arch arm: "aarch64", intel: "x64"

  version "2.2.4"
  sha256 arm:   "476f99e4dad61d6e44782ac6a91cdcebbc9aab2991d8d10e2e72de4120c8a166",
         intel: "c2940dd1450113d984456e598ab46c8179cefb1a55e8555a451e36ec3ffbbaca"

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
