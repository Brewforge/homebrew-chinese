cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.3"
  sha256 arm:   "35a05750370159b4244ee0cfea7f82b231b4a02674c418e2d43110a715a8495a",
         intel: "16fd80f80c3ae110b9af0fc7ea0cfc2ba8c029259b0664f9743daa99bc5b87f7"

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
