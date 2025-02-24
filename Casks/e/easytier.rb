cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "2.2.2"
  sha256 arm:   "69a583d611a103bea84310a089cade89677a391e60f21e878eb09f10a61433d3",
         intel: "a9e4225224bb13eb593a1b8edb3387faffd477e13a48f8fe417cba35aa680f24"

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
