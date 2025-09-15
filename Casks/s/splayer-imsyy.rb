cask "splayer-imsyy" do
  arch arm: "-arm64", intel: ""

  version "3.0.0-beta.2"
  sha256 arm:   "4239da3c2a7ea8b88071fb87ff2458fd88b8a85931c5fe4cbbfa41d265cb713f",
         intel: "85ac83af0148db9bdfaf5463444cca4157425da31c0f757c5e53042a8fc836cf"

  url "https://github.com/imsyy/SPlayer/releases/download/v#{version}/splayer-#{version}-mac.zip"
  name "SPlayer"
  desc "简约的音乐播放器"
  homepage "https://github.com/imsyy/SPlayer"

  livecheck do
    url :url
    regex(/splayer-v?(\d+(?:\.\d+)+)(-beta\.\d)?#{arch}-mac\.zip$/i)
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

  caveats do
    requires_rosetta
  end
end
