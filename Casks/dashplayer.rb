cask "dashplayer" do
  arch arm: "arm64", intel: "x64"

  version "4.1.0"
  sha256 arm:   "902d42670853d222b7eb5ba3634f08b66393a4a15a6f8d9dfbd330e645403b41",
         intel: "6010df1646176b964c2ad8fba32f189aff9c0d04018161d330971fa33fe06615"

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
