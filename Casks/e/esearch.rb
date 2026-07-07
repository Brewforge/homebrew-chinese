cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.3.3"
  sha256 arm:   "ca3e11e75dfa1e729b34a0ebf22f2c7c7496be0441b6118ad5e50f87566ef971",
         intel: "7e7921630d2807da813b74164958e01ae06a12a68a66ca69418bead770248c42"

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
