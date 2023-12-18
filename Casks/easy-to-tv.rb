cask "easy-to-tv" do
  version "0.1.20"
  sha256 "6e5179e8bc60cfb0897714debe47dc0fe81c15859ca3536de6bed92fbd72ad8e"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/duolabmeng6/easy_to_tv/releases/download/v#{version}/easy_to_tv_MacOS.zip"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "easy-to-tv"
  desc "Easily put the mp4 files onto the TV to watch"
  homepage "https://github.com/duolabmeng6/easy_to_tv"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  app "easy_to_tv.app"

  zap trash: [
    "~/Library/Preferences/easy_to_tv.plist",
  ]
end
