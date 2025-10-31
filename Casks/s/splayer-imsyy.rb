cask "splayer-imsyy" do
  arch arm: "-arm64", intel: "x64"

  version "3.0.0-beta.2"
  sha256 arm:   "sha256:fe4c400688931d11b893dda8a55532bcd2f228d36e8ee1ea92ca842c2adb2cc0",
         intel: "85ac83af0148db9bdfaf5463444cca4157425da31c0f757c5e53042a8fc836cf"

  url "https://github.com/imsyy/SPlayer/releases/download/v#{version}/SPlayer-#{version}-#{arch}.dmg"
  name "SPlayer"
  desc "简约的音乐播放器"
  homepage "https://github.com/imsyy/SPlayer"

  livecheck do
    url :url
    strategy :github_latest
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
