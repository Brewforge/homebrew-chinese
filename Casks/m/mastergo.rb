cask "mastergo" do
  arch arm: "-arm"
  key = on_arch_conditional arm: "M1"

  version "1.11.7"
  sha256 arm:   "e856ef5f6fd876a089f79f96d545f0a8a9070aeb8c7c2fbf26d0c969c460da01",
         intel: "1dab0635c3d90d5eb02b3af6d623f3996af9760badf5a1d19c919accc541b97d"

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
