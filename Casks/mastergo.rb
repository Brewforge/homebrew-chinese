cask "mastergo" do
  arch arm: "-arm", intel: ""

  version "1.8.0"
  sha256 arm:   "2a875196e75ddd732041912a2905a74dae0d51f64556032a933ffa5a291a6e88",
         intel: "9369a72746d3c6ba357cbde39ba8f77e14ad7633b3bee1fcaecc80c00a3404aa"

  url "https://static.mastergo.com/plugins/desktop/macos#{arch}/MasterGo-#{version}.dmg"
  name "MasterGo"
  desc "Prototype design platform"
  homepage "https://mastergo.com"

  livecheck do
    # url :homepage
    # regex(/Mac(\d+(\.\d+)+)/i)
    # strategy :page_match
    skip
  end

  auto_updates true

  app "MasterGo.app"

  zap trash: [
    # "~/Library/Logs/master-desktop",
    # "~/Library/Preferences/com.electron.master-desktop.plist",
    # "~/Library/Saved Application State/com.electron.master-desktop.savedState",
    # "~/Library/Application Support/master-desktop",
  ]
end
