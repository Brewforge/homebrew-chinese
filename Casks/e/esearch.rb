cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "14.9.0"
  sha256 arm:   "b45f68cb5de4c4e6263048a1dfabcfbd09a515fbfb95adb862623c81ffb76a6b",
         intel: "2b69e878d11392b8e2525b9b54cd267a050618ad1dcefef0b9a5f1c7e4732ee3"

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
