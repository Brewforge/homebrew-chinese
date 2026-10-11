cask "dashplayer" do
  version "6.13.3"
  sha256 "6a182f56060d2fe19f5dbe8be5b1c628e39ee4b7f8829241bea9ee2dd9011141"

  url "https://github.com/solidSpoon/DashPlayer/releases/download/v#{version}/DashPlayer-#{version}-arm64.dmg"
  name "DashPlayer"
  desc "为英语学习者量身打造的视频播放器"
  homepage "https://dash-player.solidspoon.xyz/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "DashPlayer.app"

  zap trash: [
    "~/Library/Application Support/DashPlayer",
    "~/Library/Preferences/com.electron.dashplayer.savedState.plist",
    "~/Library/Saved Application State/com.electron.dashplayer.savedState",
  ]
end
