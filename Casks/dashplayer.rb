cask "dashplayer" do
  arch arm: "arm64", intel: "x64"

  version "4.2.2"
  sha256 arm:   "bbce39acd6b7979508704b47e3f01cc183dd89e75de2f8902cddbc951e1d5c39",
         intel: "4232aa73870e1c6d09477b320a33d412c76ef72c869e6f0511a873faa64ab676"

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
