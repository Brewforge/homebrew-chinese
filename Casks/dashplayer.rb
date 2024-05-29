cask "dashplayer" do
  arch arm: "arm64", intel: "x64"

  version "4.2.1"
  sha256 arm:   "3639560866d32c63e6690a2daee2b74e8486c3bfe7623db01f943ad379911be7",
         intel: "b1c9531fa485ae5728afdea574a646666305eaa85cf9311a70fecb6e915256bd"

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
