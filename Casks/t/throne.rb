cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.0.9"
  sha256 arm:   "fd6dae4517981352897cf1ed422335f0e0a3a8f5bc54f50d0b60934a4fda8258",
         intel: "7ca51128d9f0c3f7b13a1bffbedc95b93d3d2fe9dcd4cc782ec41a499ca7ffd8"

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
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/moe.Throne.macosx",
    "~/Library/Preferences/Throne",
  ]
end
