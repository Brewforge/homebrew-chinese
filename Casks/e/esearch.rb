cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "14.6.4"
  sha256 arm:   "2aa9bd472b77b33dfa52ec69f74cb1becd9f5def91a630bf9284876912277605",
         intel: "b8d2084718821126a0133afd35e3f5e6557e58a3f73a616c224639b235dbf71a"

  url "https://github.com/xushengfeng/eSearch/releases/download/#{version}/eSearch-#{version}-darwin-#{arch}.dmg",
      verified: "github.com/xushengfeng/eSearch/"
  name "eSearch"
  desc "Screenshot, OCR, Search, Translation and More"
  homepage "https://esearch-app.netlify.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "e-search.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.esearch.app",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.esearch.app.helper.GPU",
    "~/Library/Application Support/eSearch",
    "~/Library/Preferences/com.esearch.app.plist",
  ]
end
