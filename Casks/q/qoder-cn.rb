cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "0.5.21"
  sha256 arm:   "dde2f66eff2c1d45a114aba0dc6e26fb49134a7b13f0bf53f12c30b2fdcf1a8b",
         intel: "2ebe0c2faf348ccbfa61753d9d84a5209955ee382c2bdd5c05e73526db1afd39"

  url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-#{arch}.zip"
  name "Qoder CN"
  desc "AI 驱动的智能编程平台（国内版）"
  homepage "https://qoder.com.cn/"

  livecheck do
    url "https://static.qoder.com.cn/qoder-app/releases/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: :monterey

  app "Qoder CN.app"

  uninstall quit: "com.qodercn.app"

  zap trash: [
    "~/.qoder",
    "~/Library/Application Support/com.qodercn.app",
    "~/Library/Application Support/Qoder",
    "~/Library/Caches/com.qodercn.app",
    "~/Library/Caches/com.qodercn.app.ShipIt",
    "~/Library/Preferences/com.qodercn.app.plist",
    "~/Library/Saved Application State/com.qodercn.app.savedState",
  ]
end
