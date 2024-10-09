cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "2.0.1"
  sha256 arm:   "524b510cd346b8cb393d2f4cd0179b18b7496eb0db4692088e1aa6322206f3fa",
         intel: "5918f6f1a76d16e6eb8f0dd390e09373b82ee9e4b4f005c23e62a5fde8b6e0e3"

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
