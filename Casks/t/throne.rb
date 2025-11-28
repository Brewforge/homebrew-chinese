cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.0.10"
  sha256 arm:   "171a309b789f7fd1068ce67e213ed6dd7387113047ba52c686ee8c6156ae5fe3",
         intel: "a70679f04e0386005b303d942e352c461caed2c31efa5bf26437b9bc4c25ffd1"

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
