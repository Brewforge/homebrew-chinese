cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.5.1"
  sha256 arm:   "0d4d1e8d59d61e58d2a6c1d85fd4eb5979e8af4b1fdc793e8e270d9c9ef7e037",
         intel: "aa6ae3b27caa912f167832cec7250e7c2b7cc87e7be0f639dcaab95b31d88c37"

  url "https://github.com/xushengfeng/eSearch/releases/download/#{version}/eSearch-#{version}-darwin-#{arch}.dmg"
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
