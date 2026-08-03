cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.3.4"
  sha256 arm:   "3e92bddd248848eb62f3ff8dc944ba4305adf9c7a3afdd686e4917e1a137aa7d",
         intel: "a92f1107f2e4469dc51b9fd7c610f237c4b158db916a4954c2a504ac017b227d"

  url "https://github.com/xushengfeng/eSearch/releases/download/#{version}/eSearch-#{version}-darwin-#{arch}.dmg",
      verified: "github.com/xushengfeng/eSearch/"
  name "eSearch"
  desc "Screenshot, OCR, Search, Translation and More"
  homepage "https://esearch-app.netlify.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "e-search.app"

  zap trash: [
    "~/Library/Application Support/eSearch",
    "~/Library/Preferences/com.esearch.app.plist",
  ]
end
