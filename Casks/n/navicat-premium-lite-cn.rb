cask "navicat-premium-lite-cn" do
  version "17.2.2"
  sha256 :no_check

  url "https://dn.navicat.com.cn/download/navicat17_premium_lite_cs.dmg"
  name "Navicat Premium Lite"
  desc "Database administration and development tool"
  homepage "https://navicat.com.cn/products/navicat-premium-lite"

  livecheck do
    url "https://updater.navicat.com/mac/v#{version.major}/navicat_updates.php?appName=Navicat%20Premium"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Navicat Premium Lite.app"

  zap trash: [
    "~/Library/Application Support/PremiumSoft CyberTech/Navicat CC/Navicat Premium",
    "~/Library/Caches/com.apple.helpd/Generated/Navicat Help*",
    "~/Library/HTTPStorages/com.navicat.NavicatPremiumLite",
    "~/Library/Preferences/com.navicat.NavicatPremiumLite.plist",
    "~/Library/Saved Application State/com.navicat.NavicatPremiumLite.savedState",
  ]
end
