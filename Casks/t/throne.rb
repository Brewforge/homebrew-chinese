cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.0.0-beta.6"
  sha256 arm:   "0bfd63c854297b8f38253ef66ab78ae210a82fae8f3a6c5bad4a5f210e57f6ff",
         intel: "f8dbc750efffadb2e0d222e4f6ac74262e62679ee113aac52870259e7e894cc6"

  url "https://github.com/throneproj/Throne/releases/download/#{version}/Throne-#{version}-macos-#{arch}.zip"
  name "Throne"
  desc "Cross-platform GUI proxy utility"
  homepage "https://github.com/throneproj/Throne"

  livecheck do
    url "https://github.com/throneproj/Throne/tags"
    strategy :page_match do |page|
      match = page.match(/href=.*?(\d+(\.\d+)+)(-beta\.\d)/i)
      next if match.blank?

      match[1].to_s + match[3].to_s
    end
  end

  auto_updates true

  app "Throne/Throne.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/moe.Throne.macosx",
    "~/Library/Preferences/Throne",
  ]
end
