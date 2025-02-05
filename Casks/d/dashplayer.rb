cask "dashplayer" do
  arch arm: "arm64", intel: "x64"

  version "5.1.2"
  sha256 "0f950573597f67ec82d3b18b41948d49cf91b1a06721cc375e688799091fd0e6"

  url "https://github.com/solidSpoon/DashPlayer/releases/download/v#{version}/DashPlayer-#{version}-arm64.dmg",
    verified: "github.com/solidSpoon/DashPlayer"
  name "DashPlayer"
  desc "为英语学习者量身打造的视频播放器"
  homepage "https://dash-player.solidspoon.xyz/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "DashPlayer.app"

  zap trash: [
    "~/Library/Application Support/DashPlayer",
    "~/Library/Preferences/com.electron.dashplayer.savedState.plist",
    "~/Library/Saved Application State/com.electron.dashplayer.savedState",
  ]
end
