cask "i4tools" do
  arch arm: "arm64", intel: "x64"

  version "9.11.003"
  sha256 :no_check

  url "https://d-updater.i4.cn/i4tools9/download/macos/arm64/i4Tools_v#{version}_#{arch}.dmg"
  name "i4Tools"
  name "爱思助手"
  desc "Mobile device management software"
  homepage "https://i4.cn/"

  livecheck do
    url :url
    strategy :header_match
    regex(/i4Tools_v?(\d+(\.\d+)+)_arm64\.dmg/i)
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
