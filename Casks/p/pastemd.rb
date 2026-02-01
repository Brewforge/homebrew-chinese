cask "pastemd" do
  version "0.1.6.8"
  sha256 "b1fb01aae6543239f4faba5e99670984987e69a7bda1d715f81c78dd1b2b00fd"

  url "https://github.com/RICHQAQ/PasteMD/releases/download/v#{version}/PasteMD-#{version}.dmg",
      verified: "github.com/RICHQAQ/PasteMD/"
  name "pastemd"
  desc "One-click paste Markdown and AI responses into Word, WPS, and Excel perfectly"
  homepage "https://pastemd.richqaq.cn/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "PasteMD.app"

  zap trash: [
    "~/Documents/GitHub/scoop-extras-plus/bucket/pastemd.json",
    "~/Library/Application Support/PasteMD",
    "~/Library/Logs/PasteMD",
  ]
end
