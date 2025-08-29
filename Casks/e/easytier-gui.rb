cask "easytier-gui" do
  arch arm: "aarch64", intel: "x64"

  version "2.4.3"
  sha256 arm:   "dbd14bea7211f543ec57446d9cfe29cb19eb4c8febfdd659f9f3e60b509d0013",
         intel: "241cfe0aeea1e4b067d1011e76b6263d1da189674e7149aa92b6bced1a419f11"

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
