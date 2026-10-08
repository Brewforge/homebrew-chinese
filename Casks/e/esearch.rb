cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.6.0"
  sha256 arm:   "60af70d497194db599d94d76f7bdec2e42a0fef98b2f353bac4da92edd0c28d3",
         intel: "5949715bfd769b609132da3c5ad323586ac37187f9d4a84fc9aed66772d939f3"

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
