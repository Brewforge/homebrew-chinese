cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.0"
  sha256 arm:   "07bc31e9b017cdf25e68fdffd52f53291f2f24ae89aee56b67fadb95dc82904c",
         intel: "680cb253a95874c1e5341b8a4750fb07fb6d32abe1b11bc1b68f9cb7351faf78"

  url "https://github.com/throneproj/Throne/releases/download/#{version}/Throne-#{version}-macos-#{arch}.zip"
  name "Throne"
  desc "Cross-platform GUI proxy utility"
  homepage "https://github.com/throneproj/Throne"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Throne/Throne.app"

  zap trash: "~/Library/Preferences/Throne"
end
