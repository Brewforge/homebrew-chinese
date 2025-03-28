cask "mastergo" do
  arch arm: "-arm", intel: ""
  key = on_arch_conditional arm: "M1", intel: ""

  version "1.10.0"
  sha256 arm:   "81710927c134dbc287b695ba2e69e75ec87479d17a2eabe6994d9d599ccdf608",
         intel: "cabcffd1f19adb56758e7c68a58eaf8682a36bb44c6ed388bc5979c8ff21a36a"

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

  auto_updates true

  app "MasterGo.app"

  zap trash: [
    "~/Library/Application Support/master-desktop",
    "~/Library/Logs/master-desktop",
    "~/Library/Preferences/com.electron.master-desktop.plist",
    "~/Library/Saved Application State/com.electron.master-desktop.savedState",
  ]
end
