cask "splayer-imsyy" do
  arch arm: "arm64", intel: "x64"

  version "3.0.0-beta.4"
  sha256 arm:   "4572dac423be14bd0e2e2a2d3b0bc37f2acf03db8e728c3e885ca96e8543cb74",
         intel: "5b36fb83a9c43f43c8105edc4f3cd1ad2fc51e40a9c2b799924532ce8b52b81f"

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
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.imsyy.splayer",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.imsyy.splayer.helper.GPU",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.AqfEFU",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.BzfhiL",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.DWAwjb",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.GZPyQh",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.hfIAKT",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.HHoeBW",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.hypzun",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.IEZz3f",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.KLAtwS",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.KlbVAX",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.M3pE2r",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.MRG9Ne",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.S1m6Ay",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.Sjp5VC",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.tmFZvk",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.v3M8rZ",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.VbqLvd",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.WqeSwl",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.imsyy.splayer.YctRpg",
    "~/Documents/SPlayer",
    "~/Library/Application Support/SPlayer",
    "~/Library/Preferences/com.imsyy.splayer.plist",
    "~/Library/Saved Application State/com.imsyy.splayer.savedState",
  ]
end
