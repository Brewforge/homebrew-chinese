cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.0.1"
  sha256 arm:   "3783be3a0a4ea3db13b37ad44399a5e619aba72c6ecc1f4c9b115f0a6c7d7967",
         intel: "65c5f152613bc48e5b01941b9f6830a6698a3f04488df4b476b7c0fc69037a9b"

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
