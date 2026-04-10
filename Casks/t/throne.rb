cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.2"
  sha256 arm:   "74b01227c4879d24b05827e176aa8213948dc7ee276a866aef4f49b8d2dd7191",
         intel: "e0471f5ee9036823140c37032541afd8fc0b08b4b85e20253469540c6a7ad9f5"

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

  zap trash: "~/Library/Preferences/Throne"
end
