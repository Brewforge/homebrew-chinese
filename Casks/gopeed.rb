cask "gopeed" do
  version "1.5.2"
  sha256 "53f869d288d94edc3680e62086048a82975f49ac47f3446d63ac5f7897275ab9"

  url "https://github.com/GopeedLab/gopeed/releases/download/v#{version}/Gopeed-v#{version}-macos.dmg",
      verified: "github.com/GopeedLab/gopeed/"
  name "Gopeed"
  desc "High speed downloader that supports all platforms"
  homepage "https://gopeed.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Gopeed.app"

  zap trash: [
    "~/Library/Application Scripts/com.gopeed",
    "~/Library/Containers/com.gopeed",
  ]
end
