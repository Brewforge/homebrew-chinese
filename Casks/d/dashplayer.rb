cask "dashplayer" do
  arch arm: "arm64", intel: "x64"

  version "4.3.0"
  sha256 arm:   "1ce1bfcc36a887e7c05c13653e83447b9e1da82bf536ad5d85f02e35ca555476",
         intel: "3ac1a93ceb077f2f15988782416e7dc2bdbdc87d2477e48406a80233a2637b57"

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
