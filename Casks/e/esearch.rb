cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.2.1"
  sha256 arm:   "1e16252fc0bd3d19756e6b114dac5a8a6d6e6c6af136b365f5a1d9d02e01ceda",
         intel: "f21f79980fb3c8a38dd7c93d9404f2d4d4d104eea24755968ee249ab4765d2ef"

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
  depends_on macos: ">= :big_sur"

  app "e-search.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.esearch.app",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.esearch.app.helper.GPU",
    "~/Library/Application Support/eSearch",
    "~/Library/Preferences/com.esearch.app.plist",
  ]
end
