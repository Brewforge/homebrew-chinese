cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.0.13"
  sha256 arm:   "30fc3397e127e134ae840a085a5357b00a02282e37b51208a88ed273f6bd15d2",
         intel: "e18e2ce6b5c3d6960a62372fc5d8a6f6ade3e56b10134d2e7a1308635ff04614"

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
    "~/Library/Preferences/Throne",
  ]
end
