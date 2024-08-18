cask "dashplayer" do
  arch arm: "arm64", intel: "x64"

  version "4.2.4"
  sha256 arm:   "84d265deaff935f421e69176e33c344eabfc2b3e8885f07c4359bc2a36b93eeb",
         intel: "bba77eb2c3112a574eeb3885208e9ce9f489efafd0821ca286727f9e6c48ceec"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/solidSpoon/DashPlayer/releases/download/v#{version}/DashPlayer-#{version}-#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "DashPlayer"
  desc "为英语学习者量身打造的视频播放器"
  homepage "https://github.com/solidSpoon/DashPlayer"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  app "DashPlayer.app"

  zap trash: [
    "~/Library/Application Support/DashPlayer",
    "~/Library/Preferences/com.electron.dashplayer.savedState.plist",
    "~/Library/Saved Application State/com.electron.dashplayer.savedState",
  ]
end
