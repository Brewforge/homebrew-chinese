cask "mimoho-party" do
  arch arm: "arm64", intel: "x64"

  version "1.7.0"
  sha256 arm:   "840eaabd063daddf0aec1a7e968c7d2606b3bb920e499681f5a87adfc945cf46",
         intel: "01e3c6c5d9ba87b556293f69895468bd692c7a5fc0fdec44bfdc2bc98fee59b9"

  url "https://github.com/mihomo-party-org/mihomo-party/releases/download/v#{version}/mihomo-party-macos-#{version}-#{arch}.pkg",
      verified: "github.com/mihomo-party-org/mihomo-party/"
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
