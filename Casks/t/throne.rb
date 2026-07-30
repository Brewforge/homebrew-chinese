cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.2"
  sha256 arm:   "6c5399b9bdf8e90ad32bee5b6c31fa9e71f5882b1cfd58617bf1d57673f4724c",
         intel: "7bc5cd08e39b514a91cd4cd039abf4def6f6fca609b687abe920462f045f8719"

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
