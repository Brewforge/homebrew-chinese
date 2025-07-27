cask "dashplayer" do
  arch arm: "arm64", intel: "x64"

  version "5.1.6"
  sha256 "f6e64d9d9f9c4a979a79f5651afb6f8e56a2939112767e0c77fcdcf4dffaf21f"

  url "https://github.com/solidSpoon/DashPlayer/releases/download/v#{version}/DashPlayer-#{version}-arm64.dmg",
      verified: "github.com/solidSpoon/DashPlayer/"
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
