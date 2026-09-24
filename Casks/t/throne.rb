cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.3.0"
  sha256 arm:   "6cd487dc1f2981aa175883bd00c6207dd649d18de40a25233e24a4226d9d3049",
         intel: "66761a5214c1d165c53c85f07645d95ad0f6e6176da9741eeac3baea644605a2"

  url "https://github.com/throneproj/Throne/releases/download/#{version}/Throne-#{version}-macos-#{arch}.zip"
  name "Throne"
  desc "Cross-platform GUI proxy utility"
  homepage "https://github.com/throneproj/Throne"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Throne/Throne.app"

  zap trash: "~/Library/Preferences/Throne"
end
