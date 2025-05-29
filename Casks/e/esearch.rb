cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "14.7.4"
  sha256 arm:   "7314dbf45fc4d3eae3a6a73ee8b3fe48cd957096148c62cf92e97b20dbe23f51",
         intel: "be5b8d914da2eb3c70c75cc2bc53a86bbb8828fcf33b65564c03aca4960a8a61"

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
