cask "splayer-imsyy" do
  arch arm: "arm64", intel: "x64"

  version "3.1.1"
  sha256 arm:   "eb7cafe18d1d1913e745d2fd26eec8b78e4b91471b6f6b2eff68bee118dab698",
         intel: "8166882a6d3cf09e43b2fcf5d7100bc83de9f1735f2387c62b64a285ed3435af"

  url "https://github.com/imsyy/SPlayer/releases/download/v#{version}/SPlayer-#{version}-#{arch}.dmg"
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

  depends_on macos: :monterey

  app "SPlayer.app"

  zap trash: [
    "~/Documents/SPlayer",
    "~/Library/Application Support/SPlayer",
    "~/Library/Preferences/com.imsyy.splayer.plist",
    "~/Library/Saved Application State/com.imsyy.splayer.savedState",
  ]
end
