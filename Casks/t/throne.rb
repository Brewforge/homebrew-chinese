cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.3.2"
  sha256 arm:   "c5371633f17e46d18d999206a79bafe4ec1b20e03acf51171261f3084b702b16",
         intel: "b5312bd4b6aceb5d2107be06fb6a407ec4da5159c5da0b428ac26c784bf404a9"

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
