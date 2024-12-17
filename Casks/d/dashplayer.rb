cask "dashplayer" do
  arch arm: "arm64", intel: "x64"

  version "5.0.1"
  sha256 "009c025dd03f96dc40065888ddc73284db34848e768f0b3300840d9953ef8fc3"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/solidSpoon/DashPlayer/releases/download/v#{version}/DashPlayer-#{version}-arm64.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "DashPlayer"
  desc "为英语学习者量身打造的视频播放器"
  homepage "https://dash-player.solidspoon.xyz/"

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
