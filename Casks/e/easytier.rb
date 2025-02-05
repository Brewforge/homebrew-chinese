cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "2.1.2"
  sha256 arm:   "0df9499d65eb65a11f4728e726955d2781fe3ec02e45821eee8cc36a47b20960",
         intel: "7e12653ab12631051ca559ee55c2bc80f8ead83559203ed1613cb0bdaa76b8c8"

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
