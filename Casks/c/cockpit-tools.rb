cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.21.3"
  sha256 arm:   "417c8a09df6a52aac6d448644e366121f504ecf8e2519c6c1312b914522ee4b9",
         intel: "deb49ad9f100e96b1f1bd0598065c5fc8e90a207d1db55aef4d7d24c7cfedfd0"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Cockpit Tools.app"

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
