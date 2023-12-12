cask "tinkertool" do
  version "9.65"
  sha256 "6062f38b17b206121d18cf33647782bd0d2cf9d669a6205a9cbcd37445c3e162"

  url "https://www.bresink.eu/download3.php?PHPSESSID=",
    verified: "www.bresink.biz"
  name "TinkerTool"
  desc "gives you access to additional preference settings Apple has built into macOS"
  homepage "https://www.bresink.com/osx/TinkerTool.html"

  livecheck do
    url :homepage
    regex(/(\d+(\.\d+)+).+released/i)
  end

  app "TinkerTool.app"

  zap trash: [
    "~/Library/Containers/com.bresink.system.tinkertool",
    "~/Library/Application Scripts/com.bresink.system.tinkertool",
  ]
end
