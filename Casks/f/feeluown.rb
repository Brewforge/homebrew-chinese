cask "feeluown" do
  version "4.1.16,15.6"
  sha256 "f61f4f72e00f1f140fffcf588f7d0933c1a773f33cca5b2ea45a40110bfb63c3"

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
