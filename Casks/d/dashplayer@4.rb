cask "dashplayer@4" do
  arch arm: "arm64", intel: "x64"

  version "4.4.1"
  sha256 arm:   "e5ac47fa03f45991c4fcae6702da0fad3f6c4b29f1b0cf7d6a0358b3e1cae6cc",
         intel: "305795395d92e0b12c7cba74042abe40427c2470db5c61f98f3782eb30b922b7"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/solidSpoon/DashPlayer/releases/download/v#{version}/DashPlayer-#{version}-#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "DashPlayer"
  desc "为英语学习者量身打造的视频播放器"
  homepage "https://dash-player.solidspoon.xyz/"

  livecheck do
    url "https://github.com/solidSpoon/DashPlayer/tags"
    regex(/^v(4(\.\d+)+)/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  app "DashPlayer.app"

  zap trash: [
    "~/Library/Application Support/DashPlayer",
    "~/Library/Preferences/com.electron.dashplayer.savedState.plist",
    "~/Library/Saved Application State/com.electron.dashplayer.savedState",
  ]
end
