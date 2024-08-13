cask "easytier" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.2.2"
  sha256 arm:   "0c33badbd8c55fde6fbe015455eb64d850f680a805ac6bc71aa5fbdf953d477e",
         intel: "4884589cf6d98a1172765c8ac5212935a516bf2294aaacad550bcc81040ba05f"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/EasyTier/EasyTier/releases/download/v#{version}/easytier-gui-macos-#{arch}-v#{version}.zip"

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
