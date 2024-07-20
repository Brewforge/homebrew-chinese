cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "299a0b4714298b8c9d0a670eec2621eddfce33c68f53e4a35d33e07183911e3a",
         intel: "4884589cf6d98a1172765c8ac5212935a516bf2294aaacad550bcc81040ba05f"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/EasyTier/EasyTier/releases/download/v#{version}/easytier-gui_v#{version}_#{arch}.dmg"

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
    "~/Library/Saved Application State/com.kkrainbow.easyiter-client.savedState",
  ]
end
