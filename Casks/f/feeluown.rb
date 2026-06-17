cask "feeluown" do
  version "5.1.2,15.7.7"
  sha256 "9cd776a9015f1f35d7163a9b8b236eb20bf31825c73b3bbfd7ccf7e71ff07fbf"

  url "https://github.com/feeluown/FeelUOwn/releases/download/v#{version.csv.first}/FeelUOwnX-macOS#{version.csv.second}-arm64.zip",
      verified: "github.com/feeluown/FeelUOwn/"
  name "FeelUOwn"
  desc "一个稳定、用户友好以及高度可定制的音乐播放器"
  homepage "https://feeluown.readthedocs.io/"

  livecheck do
    url :url
    regex(%r{v(\d+(\.\d+)+(a\d)?)/FeelUOwnX-macOS(\d+(\.\d+)+)-arm64\.zip$}i)
    strategy :github_latest do |json|
      json["assets"]&.map do |asset|
        match = asset["browser_download_url"]&.match(regex)
        next if match.blank?

        "#{match[1]},#{match[4]}"
      end
    end
  end

  depends_on macos: :big_sur

  app "FeelUOwnX.app"

  zap trash: "~/Library/Saved Application State/org.feeluown.FeelUOwnX.savedState"
end
