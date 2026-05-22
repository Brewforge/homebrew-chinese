cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.4"
  sha256 arm:   "46f067d46a2a600db6006d2261745cb3163d5482924103718a2580944593ccc0",
         intel: "6b535133ec3fee269df4ec14768668c70c22ca1510738873dd78ad789034e743"

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
