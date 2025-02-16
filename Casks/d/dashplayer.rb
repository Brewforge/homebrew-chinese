cask "dashplayer" do
  arch arm: "arm64", intel: "x64"

  version "5.1.3"
  sha256 "95d635140b7293ecc44afa337a0c4f4e3cf64b2a9fe2dfa47933e6685d7b3313"

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
