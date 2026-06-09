cask "mastergo" do
  arch arm: "-arm", intel: ""
  key = on_arch_conditional arm: "M1", intel: ""

  version "1.10.9"
  sha256 arm:   "f4b463aaa64798263973ab312113d292f8d2dea1817bb3c43891a961fc38429c",
         intel: "649892cbc42d5d5749a1b454837cd16eca19819565b4821888805ba15f4d9f58"

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
  depends_on :macos

  app "MasterGo.app"

  zap trash: [
    "~/Library/Application Support/master-desktop",
    "~/Library/Logs/master-desktop",
    "~/Library/Preferences/com.electron.master-desktop.plist",
    "~/Library/Saved Application State/com.electron.master-desktop.savedState",
  ]
end
