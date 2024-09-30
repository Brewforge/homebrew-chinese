cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "2.0.0"
  sha256 arm:   "1655eddc6788b564c0b3967bd7f36a3d122d35cb7277eeebc032c5a7e50707c0",
         intel: "c04d3e59a8bc173cd1931a75f8b3535537401c4dde8cb6f01d218f9d816bbd2b"

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
