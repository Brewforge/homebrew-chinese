cask "dashplayer" do
  arch arm: "arm64", intel: "x64"

  version "5.1.5"
  sha256 "058edf48f3cb2b576f56a13d438e3c5cca1535252ebdb165467c6a7a38e1ffc0"

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
