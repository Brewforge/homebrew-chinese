cask "i4tools" do
  version "9.12"
  sha256 :no_check

  url "https://url.i4.cn/FFRBr2aa"
  name "i4Tools"
  name "爱思助手"
  desc "Mobile device management software"
  homepage "https://i4.cn/"

  livecheck do
    skip "no available info"
  end

  depends_on :macos

  pkg "i4tools#{arch}.pkg"

  uninstall quit:    "cn.i4tools.mac",
            pkgutil: "cn.i4tools.mac"

  zap trash: [
    "~/Library/Application Support/i4Airplayer/",
    "~/Library/Application Support/i4Tools/",
    "~/Library/Preferences/cn.i4tools.mac.plist",
    "~/Library/Preferences/org.example.i4AirPlayer.plist",
    "~/Library/Saved Application State/org.example.i4AirPlayer.savedState",
  ]
end
