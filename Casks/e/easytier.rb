cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "2.2.0"
  sha256 arm:   "26fe447ee5e0a97c87208176bd6876cd76678f964c78c7dcd01a32f0848550a2",
         intel: "eb7b4818f9cd078477417b6e4e82d9668e47c27b2a9b27c1e6251c4fe733fe47"

  url "https://github.com/EasyTier/EasyTier/releases/download/v#{version}/easytier-gui_#{version}_#{arch}.dmg",
      verified: "github.com/EasyTier/EasyTier/"
  name "EasyTier"
  desc "简单、安全、去中心化的内网穿透 VPN 组网方案"
  homepage "https://www.easytier.top/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "easytier-gui.app"

  zap trash: "~/Library/Logs/com.kkrainbow.easytier"
end
