cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "2.0.2"
  sha256 arm:   "22142a82910249d43ea512168bf3145ae396cfb4778cf31e95a0d63301789582",
         intel: "2e1b94d13ea0431d2bd634af298688791edce0d6a4df34e7de438f7c629ff55a"

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
