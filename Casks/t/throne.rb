cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.0.11"
  sha256 arm:   "7da0af799fe9825db7380e6b59147beb181bf46e2ee5a5c8a437e339584f99e1",
         intel: "c560eefe18332e3979baf2e2b5a6aa2c9fe09358c2c0b6807bbf26d2e457ee81"

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
