cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "0.5.18"
  sha256 arm:   "09308da98ef89318ea5e868243ab9707bd877607c61088ac37fdc73c6991c104",
         intel: "4f268fb2f6ac868fbc489d7f08c0ba51a6d14f9ec13449a3127c10b431684314"

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
