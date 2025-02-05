cask "mimoho-party" do
  arch arm: "arm64", intel: "x64"

  version "1.6.0"
  sha256 arm:   "fc97e86b73fdc2ae6a6827618d565dc4a9c97606139050bc6d263999cc49e28f",
         intel: "3dc5653bc8a34249b986e6c74b6dab732b7c930bcf325749a68f565ef7ca7b78"

  url "https://github.com/mihomo-party-org/mihomo-party/releases/download/v#{version}/mihomo-party-macos-#{version}-#{arch}.pkg"
  name "Mihomo Party"
  desc "Another Mihomo GUI"
  homepage "https://mihomo.party/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  pkg "mihomo-party-macos-#{version}-#{arch}.pkg"

  uninstall quit:    "party.mihomo.app",
            pkgutil: "party.mihomo.app"

  zap trash: [
    "/var/db/receipts/party.mihomo.app.bom",
    "/var/db/receipts/party.mihomo.app.plist",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/party.mihomo.app",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/party.mihomo.app.helper.GPU",
    "~/Library/Preferences/party.mihomo.app.plist",
    "~/Library/Saved Application State/party.mihomo.app.savedState",
  ]
end
