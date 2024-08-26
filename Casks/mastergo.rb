cask "mastergo" do
  arch arm: "-arm", intel: ""

  version "1.8.2"
  sha256 arm:   "42e970f0f5a303018cfd7fe7bd4b7aac2cead341464db02e295a48c1307d943b",
         intel: "3fe5f5824f07bdb4480bb0bf06991f5c0db5098f00e5a9bf14f9194013a82439"

  url "https://static.mastergo.com/plugins/desktop/macos#{arch}/MasterGo-#{version}.dmg"
  name "MasterGo"
  desc "Prototype design platform"
  homepage "https://mastergo.com/"

  livecheck do
    url "https://mastergo.com/api/v1/config"
    strategy :page_match do |page|
      JSON.parse(JSON.parse(page)["data"])["electronMac#{on_intel do
                                                           ""
                                                         end
                                                         on_arm do
                                                           "M1"
                                                         end}"]
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
