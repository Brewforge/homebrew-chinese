cask "mastergo" do
  arch arm: "-arm", intel: ""
  key = on_arch_conditional arm: "M1", intel: ""

  version "1.10.2"
  sha256 arm:   "910ec3df619c5a65d6ed7df13841c510dafcc7a4bf13ae4d4d8c36f300c45dd9",
         intel: "b1a7c3878c54b05f899c75ac4577da17a7b0259a6c9fc4be0e71a2ca9e20f1b2"

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
