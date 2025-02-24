cask "easy-to-tv" do
  version "0.1.20"
  sha256 "6e5179e8bc60cfb0897714debe47dc0fe81c15859ca3536de6bed92fbd72ad8e"

  url "https://github.com/duolabmeng6/easy_to_tv/releases/download/v#{version}/easy_to_tv_MacOS.zip"
  name "easy-to-tv"
  desc "Easily put the mp4 files onto the TV to watch"
  homepage "https://github.com/duolabmeng6/easy_to_tv"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "easy_to_tv.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/easy_to_tv",
    "~/Library/Preferences/easy_to_tv.plist",
    "~/Library/Saved Application State/easy_to_tv.savedState",
  ]
end
