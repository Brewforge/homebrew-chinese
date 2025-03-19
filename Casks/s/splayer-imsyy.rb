cask "splayer-imsyy" do
  version "3.0.0-beta.1"
  sha256 "ccbc6a30c046f0a3e9efb861d435b218def68971b65891ee7eede17eae3f1f6c"

  url "https://github.com/imsyy/SPlayer/releases/download/v#{version}/splayer-#{version}.dmg"
  name "SPlayer"
  desc "简约的音乐播放器"
  homepage "https://github.com/imsyy/SPlayer"

  livecheck do
    url "https://github.com/imsyy/SPlayer/releases"
    regex(/splayer-v?(\d+(?:\.\d+)+)(-beta\.\d)?\.dmg$/i)
    strategy :github_latest do |json, regex|
      json["assets"]&.map do |asset|
        match = asset["browser_download_url"]&.match(regex)
        next if match.blank?

        "#{match[1]}#{match[2]}"
      end
    end
  end

  auto_updates true

  app "SPlayer.app"

  zap trash: []
end
