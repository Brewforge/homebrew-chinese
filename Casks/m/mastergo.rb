cask "mastergo" do
  arch arm: "-arm"
  key = on_arch_conditional arm: "M1", intel: ""

  version "1.11.5"
  sha256 arm:   "8632932972f3606783b89361a0ffe31952e5e102b627c79a29bf1fde96a30e71",
         intel: "6061aac2da91f45376202a2967c4e23f45fa1e3b119b3a390f0798a403c915aa"

  url "https://static.mastergo.com/plugins/desktop/macos#{arch}/MasterGo-#{version}.dmg"
  name "MasterGo"
  desc "Prototype design platform"
  homepage "https://mastergo.com/"

  livecheck do
    url "https://mastergo.com/api/v1/config"
    strategy :page_match do |page|
      JSON.parse(JSON.parse(page)["data"])["electronMac#{key}"]
    end
  end

  depends_on :macos

  app "MasterGo.app"

  zap trash: [
    "~/Library/Application Support/master-desktop",
    "~/Library/Logs/master-desktop",
    "~/Library/Preferences/com.electron.master-desktop.plist",
    "~/Library/Saved Application State/com.electron.master-desktop.savedState",
  ]
end
