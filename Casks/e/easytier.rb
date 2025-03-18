cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "2.2.3"
  sha256 arm:   "ec54f2e2ec54e791d903dfebd6a94e6258f7401aee05d37b37d05cfad74b1b1c",
         intel: "ba53b5a29adafe70de6e6233d76301ee15231d8a2238a2eb6184e3d7cb9dbfeb"

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
