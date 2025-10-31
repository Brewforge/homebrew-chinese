cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.0.8"
  sha256 arm:   "91f7be1f282c300ecbbae785f8dc9b361cfe2260fafdb6e16c1e376bb1263219",
         intel: "7e52a0186586ff815ac3cd4485e4579813ed825b3ecc7a2024c5b5f49d7c77df"

  url "https://github.com/throneproj/Throne/releases/download/#{version}/Throne-#{version}-macos-#{arch}.zip"
  name "Throne"
  desc "Cross-platform GUI proxy utility"
  homepage "https://github.com/throneproj/Throne"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Throne/Throne.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/moe.Throne.macosx",
    "~/Library/Preferences/Throne",
  ]
end
