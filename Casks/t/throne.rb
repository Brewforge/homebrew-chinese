cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.0"
  sha256 arm:   "e55f2b997e43f78a478dc2f1554f2567252997ef5e5877951fa2f9b343a47390",
         intel: "c264efccb70d39ebab697305e23a1461c3c40ff147494df3e69e427e68d10d11"

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
