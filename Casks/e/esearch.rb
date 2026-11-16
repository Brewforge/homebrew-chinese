cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.8.0"
  sha256 arm:   "b1cd3f57c69e0784319d763ed9fa51c9534fb5259f6f6d6a5195801ea8bcfaa9",
         intel: "0f9290cc276bb8e5e5f1ab7f58945a29acf5265a84d21c916555313bffd9c620"

  url "https://github.com/xushengfeng/eSearch/releases/download/#{version}/eSearch-#{version}-darwin-#{arch}.dmg"
  name "eSearch"
  desc "Screenshot, OCR, Search, Translation and More"
  homepage "https://esearch-app.netlify.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "e-search.app"

  zap trash: [
    "~/Library/Application Support/eSearch",
    "~/Library/Preferences/com.esearch.app.plist",
  ]
end
