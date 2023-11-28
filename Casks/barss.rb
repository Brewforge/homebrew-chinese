cask "barss" do
  version "1.2.2"
  sha256 "e58add78e127c1673a3f8e1c8904ffaf77473a54895ffeb94effc2d4000500f8"

  url "https://github.com/relikd/baRSS/releases/download/v#{version}/baRSS_#{version}.zip",
      verified: "github.com/relikd/baRSS/"
  name "baRSS"
  desc "Menu Bar RSS reader"
  homepage "https://relikd.de/projects/barss/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "baRSS.app"

  zap trash: [
    "~/Library/Application Scripts/de.relikd.baRSS",
    "~/Library/Containers/de.relikd.baRSS",
  ]
end
