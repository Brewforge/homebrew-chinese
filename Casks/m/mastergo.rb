cask "mastergo" do
  arch arm: "-arm"
  key = on_arch_conditional arm: "M1"

  version "1.12.2"
  sha256 arm:   "366e6a9cbabdf8e99a339f61cd76ad569438aa8926275a756ca7f8903325540a",
         intel: "e5e907864ac1ec1001aa9b51ff84834ed3e50a640d559badb7c5aaa5a45dcd7d"

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
