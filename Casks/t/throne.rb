cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.3"
  sha256 arm:   "8183c6e200c4590ecc3ba9d3597b2591f8aa8283c4783ead5b27cb56f3d26f35",
         intel: "6a291db3f59af66fab8cd8c93a1a650ba0c5c4fb1a1d2d782370487973cc569a"

  url "https://github.com/throneproj/Throne/releases/download/#{version}/Throne-#{version}-macos-#{arch}.zip"
  name "Throne"
  desc "Cross-platform GUI proxy utility"
  homepage "https://github.com/throneproj/Throne"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :big_sur

  app "Throne/Throne.app"

  zap trash: "~/Library/Preferences/Throne"
end
