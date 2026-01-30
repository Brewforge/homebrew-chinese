cask "splayer-imsyy" do
  arch arm: "arm64", intel: "x64"

  version "3.0.0-beta.9"
  sha256 arm:   "432f77efb70b85456fa4dd9d686cda07cff454233b4cff3a55d9a5d0521194c3",
         intel: "4039a4a780fa17d1b12faa47af2dbab1683d78042bb4d80b7a3a01582e4ce782"

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
