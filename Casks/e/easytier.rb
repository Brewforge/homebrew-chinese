cask "easytier" do
  arch arm: "aarch64", intel: "x64"

  version "2.2.1"
  sha256 arm:   "ab57418b62d14f1cb8616e4a4af5c528e50c58655e57a09b3439d95139d06a20",
         intel: "3581b00f78d5ca7f57b836c22b93a704e2c0dd7b2bc139b9a097e980cafe0a7e"

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
