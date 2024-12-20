cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "2.1.0"
  sha256 arm:   "c728f8afd5f66f28ad2247bb51da3235d3c44cf3595d12ba39f7552a0ebc3e5f",
         intel: "709b18d83ff94d4d53a0365c7c0432434ae858de1c98612edd532d651fbdaa2f"

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
