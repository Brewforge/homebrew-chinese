cask "esearch" do
  arch arm: "arm64", intel: "x64"

  version "15.6.1"
  sha256 arm:   "36e1358e7871952ba3848e59a2988df8ee0be069bcf2fa6336484aa0c7f195a8",
         intel: "dabc10aa1a5d62fe2a6c1c296c756cea08b34c7a34808f2a976f176917882697"

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
