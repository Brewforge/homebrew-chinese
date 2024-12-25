cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "2.1.1"
  sha256 arm:   "f9fed624a92ff148952223a4c3053505ae6df12cea7bd092536e2d88db05dd50",
         intel: "a839b29dc3753b44d8180bd5c19790cfee6f85754f30c8b4d4e1b0614a16cf4a"

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
