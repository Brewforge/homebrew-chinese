cask "mimoho-party" do
  arch arm: "arm64", intel: "x64"

  version "1.5.12"
  sha256 arm:   "4d047be0105e686914d35c77520d89b7b8d86bb9c2c30a66928c4c57632b5ff3",
         intel: "eb1528be2b251ab7d3457b5758cfe5b4332c4eaff536ed988c7332f4c44e810b"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/mihomo-party-org/mihomo-party/releases/download/v#{version}/mihomo-party-macos-#{version}-#{arch}.pkg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "Mihomo Party"
  desc "Another Mihomo GUI"
  homepage "https://mihomo.party/"

  livecheck do
    url origin.to_s
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
