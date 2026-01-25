cask "feeluown" do
  version "5.0,15.7.3"
  sha256 "df209abb8f1536e158fde029211941a09874522dda3806f7a6f73ef44877178a"

  url "https://github.com/feeluown/FeelUOwn/releases/download/v#{version.csv.first}/FeelUOwnX-macOS#{version.csv.second}-arm64.zip",
      verified: "github.com/feeluown/FeelUOwn/"
  name "FeelUOwn"
  desc "一个稳定、用户友好以及高度可定制的音乐播放器"
  homepage "https://feeluown.readthedocs.io/"

  livecheck do
    url :url
    regex(%r{v(\d+(\.\d+)+)/FeelUOwnX-macOS(\d+(\.\d+)+)-arm64\.zip$}i)
    strategy :github_latest do |json|
      json["assets"]&.map do |asset|
        match = asset["browser_download_url"]&.match(regex)
        next if match.blank?

        "#{match[1]},#{match[3]}"
      end
    end
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "FeelUOwnX.app"

  zap trash: "~/Library/Saved Application State/org.feeluown.FeelUOwnX.savedState"
end
