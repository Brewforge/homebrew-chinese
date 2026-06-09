cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.6"
  sha256 arm:   "21fe1b72096b61e4dd490b8b1b373a45f502b800925f0d24c65deb52a26b2e42",
         intel: "337cf3315035e008d9119e5a6138c4b92dde1f7f52d7a6f031f87aaa67bac4b4"

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
