cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "1.2.3"
  sha256 arm:   "95b00a54ea3f35652b7210a7f663e4c9a854dcc841dbe10cf7916bcde070f82d",
         intel: "28ce16431de433b940401b7420ee213a03ebcfb27df968b5f1ead613f5a4ed95"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/EasyTier/EasyTier/releases/download/v#{version}/easytier-gui_#{version}_#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "EasyTier"
  desc "简单、安全、去中心化的内网穿透 VPN 组网方案"
  homepage "https://www.easytier.top/"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  app "easytier-gui.app"

  zap trash: [
    "~/Library/Logs/com.kkrainbow.easytier",
  ]
end
