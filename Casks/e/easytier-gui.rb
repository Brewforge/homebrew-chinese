cask "easytier-gui" do
  arch arm: "aarch64", intel: "x64"

  version "2.3.1"
  sha256 arm:   "108eab260dd126f4e073fce202f8c407a2c8e74bf13de58ff506016daae719f9",
         intel: "3297f8e118bef99691f06eaf7bfd607e3eb62a3c8127a84d4491f9add124f8d7"

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
