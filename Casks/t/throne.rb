cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.3.1"
  sha256 arm:   "c5fc26675daa8a1d4a21e57e072e00354116be116862f1ebdb38825206a2b531",
         intel: "45603c40f01ec04877d7b53fd9a2f26fa059d6096d29972edcef17ff09400a43"

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
