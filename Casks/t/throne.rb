cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.1"
  sha256 arm:   "9f88b8dfe894d9f87835716fa71a85b0aedc756e70192a3cfaeb8c958169a385",
         intel: "b6e2bef9cc4fdc09518f5eb11daf524c8722bcb0047abe80d5831cbfd2a61e58"

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
