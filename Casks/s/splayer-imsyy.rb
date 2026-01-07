cask "splayer-imsyy" do
  arch arm: "arm64", intel: "x64"

  version "3.0.0-beta.8"
  sha256 arm:   "78cdf70defefab9d54e75cf069f91e3cf6f8d1ee951766ce0e8f7dcee90bd50c",
         intel: "af9a3d4e7576df36e16da6cef95e57a6653e5674b42fcbe5d878365983051679"

  url "https://github.com/imsyy/SPlayer/releases/download/v#{version}.2025/SPlayer-#{version}-#{arch}.dmg"
  name "SPlayer"
  desc "简约的音乐播放器"
  homepage "https://github.com/imsyy/SPlayer"

  livecheck do
    url :url
    regex(%r{/SPlayer-(\d+(\.\d+)+)(-beta\.\d)?-#{arch}\.dmg$}i)
    strategy :github_latest do |json, regex|
      json["assets"]&.map do |asset|
        match = asset["browser_download_url"]&.match(regex)
        next if match.blank?

        "#{match[1]}#{match[3]}"
      end
    end
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "SPlayer.app"

  zap trash: [
    "~/Documents/SPlayer",
    "~/Library/Application Support/SPlayer",
    "~/Library/Preferences/com.imsyy.splayer.plist",
    "~/Library/Saved Application State/com.imsyy.splayer.savedState",
  ]
end
