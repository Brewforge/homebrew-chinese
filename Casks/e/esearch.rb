cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.2.0"
  sha256 arm:   "8bc4fb8964179090816c666bcd4a5c6414c6025fe655052ec96b9c8b37677c86",
         intel: "6ce8ef79ffb2a2e0c1a1c23f1c24388bd843ff9eae68fdf12e1220de2cda60ca"

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
