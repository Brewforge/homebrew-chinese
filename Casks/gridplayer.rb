cask "gridplayer" do
  version "0.5.1"
  sha256 "8d4613c33f6a74395a16f75d12a51346d09754bac53949f962d55a8f25398818"

  url "https://github.com/vzhd1701/gridplayer/releases/download/v#{version}/GridPlayer.#{version}.dmg"
  name "gridplayer"
  desc "Play videos side-by-side"
  homepage "https://github.com/vzhd1701/gridplayer"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  app "gridplayer.app"

  zap trash: [
    "~/Library/Application Support/vzhd1701",
    "~/Library/Saved Application State/com.vzhd1701.gridplayer.savedState",
  ]
end
