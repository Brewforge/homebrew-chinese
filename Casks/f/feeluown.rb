cask "feeluown" do
  version "4.1.11,14.7.5"
  sha256 "406a8f26675ec967a283bad006236a75f2bd0853979e988175a752aa03da3f08"

  url "https://github.com/feeluown/FeelUOwn/releases/download/v#{version.csv.first}/FeelUOwnX-macOS#{version.csv.second}-arm64.zip",
      verified: "github.com/feeluown/FeelUOwn/"
  name "FeelUOwn"
  desc "一个稳定、用户友好以及高度可定制的音乐播放器"
  homepage "https://feeluown.readthedocs.io/"

  livecheck do
    url "https://github.com/feeluown/FeelUOwn/releases"
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

  app "FeelUOwnX.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/org.feeluown.FeelUOwnX",
    "~/Library/Saved Application State/org.feeluown.FeelUOwnX.savedState",
  ]
end
