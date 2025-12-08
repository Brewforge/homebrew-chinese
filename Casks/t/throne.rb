cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.0.12"
  sha256 arm:   "88d273fe7644782822676aa29893bb97a1d59345506eb93512b5384b92d60f7f",
         intel: "ff27834780d58c126b01456f0f28d7d04cb83c5fa00020a42cb25f2d78af99ec"

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
