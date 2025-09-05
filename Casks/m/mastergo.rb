cask "mastergo" do
  arch arm: "-arm", intel: ""
  key = on_arch_conditional arm: "M1", intel: ""

  version "1.10.4"
  sha256 arm:   "061cebd12bd33e273ec2f7b8cbf4465aff2bc95f8d53c42e30ad0f96cbaab2c9",
         intel: "75c122fe26d3f753a76751d739c8c26bd8027d5b98a0bd9b8db8162eeaa60d08"

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
