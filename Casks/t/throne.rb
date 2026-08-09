cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.4"
  sha256 arm:   "ef9fb2209088701e4926d3520712c6b6f737b81d8b6c40e139b7a913840f48eb",
         intel: "09dc2b830d0967bd7dfb6028c6ed513ac82ed1aaf0082f4b2b5ec326b8636f8a"

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
