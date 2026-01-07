cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.2.3"
  sha256 arm:   "1c599aa7d144802287215bb9f494721c97883ed612f53e63c382287eb3f3465c",
         intel: "2da8710582af851b45153b7ac6cfb9b6e9a7e0f304b28109c94511c3824c4b86"

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
    "~/Library/Application Support/eSearch",
    "~/Library/Preferences/com.esearch.app.plist",
  ]
end
