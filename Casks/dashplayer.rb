cask "dashplayer" do
  arch arm: "arm64", intel: "x64"

  version "4.2.0"
  sha256 arm:   "2c6fab656c00962fa048fbd7faa23ffb843e67599d36c3c757675adb633c423a",
         intel: "2dd05244155d3e665cd050e46e324619968e8eab072a29f758ca6a4fc0aae04f"

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
