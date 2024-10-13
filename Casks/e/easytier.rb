cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "2.0.3"
  sha256 arm:   "b1427c130bff6b1b0c22e76f76a1d97c8e71a2a76e0ccaf229b7b0966d2b3628",
         intel: "2984f29aeb839c180a4e5226f4c3b7d497acdfff915f10c6ea620fa68ef54a5c"

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

  zap trash: "~/Library/Logs/com.kkrainbow.easytier"
end
