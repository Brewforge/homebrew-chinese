cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.0.0"
  sha256 arm:   "c58fb1b92b89df2c33a55a61314e4b569843f64230a9930afdb90152f5a80622",
         intel: "89bb5f514ff35aa6db081acc305651579d40e5d3ec24e4b9de447989c18fd893"

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
