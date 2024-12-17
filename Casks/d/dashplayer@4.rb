cask "dashplayer@4" do
  arch arm: "arm64", intel: "x64"

  version "4.3.1"
  sha256 arm:   "a1b91d5051c5987caa979d2b34eaa5acd511265ca64223966f8a2fb9c2e7cf45",
         intel: "68dde986c129a904da1a911e5186129d5d71dc435343d14aa657d4c7641364a9"

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
