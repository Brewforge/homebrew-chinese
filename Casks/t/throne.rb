cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.4.2"
  sha256 arm:   "c56b99af9153e09ad152b42cfd2975027a097a364ddc65f66f8ea6c4476f4c0d",
         intel: "b7ef9f8a2a0c8b8f798ae03bb76479ce2f24f835e0ee440a6beaa3e9ed2df938"

  url "https://github.com/throneproj/Throne/releases/download/#{version}/Throne-#{version}-macos-#{arch}.zip"
  name "Throne"
  desc "Cross-platform GUI proxy utility"
  homepage "https://github.com/throneproj/Throne"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Throne/Throne.app"

  zap trash: "~/Library/Preferences/Throne"
end
