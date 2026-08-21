cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.4.2"
  sha256 arm:   "762c337601a907a410efa873fbf7f0869df6a927449da29da3414490fb6908fe",
         intel: "704f71b3d7e06bc890fef5a6f6dc8c4c7fbaa2a126a02aeb891af749676c512e"

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
