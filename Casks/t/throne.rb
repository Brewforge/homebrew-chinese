cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.1"
  sha256 arm:   "0c9080458e83a3cfc163befbf916935caee07449b8712297ace6a11103c85f5f",
         intel: "da4815f198ef2970a3d8167fc476e2c984ee92c6e742614bb37386238e18754b"

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
