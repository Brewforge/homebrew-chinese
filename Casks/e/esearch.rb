cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.3.2"
  sha256 arm:   "908488c38e9a19c154c89b51cf24d3b6142d1971e8bc80957e433386fda0d65a",
         intel: "76c243d24409f3d85d3decb1620c39620cd0966b84f5c8fa85bd95252e805258"

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
