cask "easytier-gui" do
  arch arm: "aarch64", intel: "x64"

  version "2.6.4"
  sha256 arm:   "29358d4b565f890b872c72092aa6391636700aae229b3a6baedaf9544b1d1407",
         intel: "f1ea217767ba88cd1b084d597359fd7e74ab17acb636fa1d8bf1c5441f726036"

  url "https://github.com/EasyTier/EasyTier/releases/download/v#{version}/easytier-gui_#{version}_#{arch}.dmg",
      verified: "github.com/EasyTier/EasyTier/"
  name "EasyTier"
  desc "简单、安全、去中心化的内网穿透 VPN 组网方案"
  homepage "https://easytier.cn/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "easytier-gui.app"

  zap trash: [
    "~/Library/Caches/com.kkrainbow.easytier",
    "~/Library/Logs/com.kkrainbow.easytier",
    "~/Library/Saved Application State/com.kkrainbow.easytier.savedState",
    "~/Library/WebKit/com.kkrainbow.easytier",
  ]
end
