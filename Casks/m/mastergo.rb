cask "mastergo" do
  arch arm: "-arm", intel: ""
  key = on_arch_conditional arm: "M1", intel: ""

  version "1.10.6"
  sha256 arm:   "8d6dc21dff4e1a553201e960ef1b24d4bdbd7f136362fe5a434a737b295a27b7",
         intel: "9a890af7cc9574f66e094b38babfb3724f241b386f92fcd61ca8433bcacc6f7e"

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
