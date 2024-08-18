cask "gopeed" do
  version "1.5.8"
  sha256 "063bed3d64ae0f47f2a7c3768304094681a8682c2ecdf7f78e1b0b92df19de04"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/GopeedLab/gopeed/releases/download/v#{version}/Gopeed-v#{version}-macos.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "Gopeed"
  desc "High speed downloader that supports all platforms"
  homepage "https://gopeed.com/"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true

  app "Gopeed.app"

  zap trash: [
    "~/Library/Application Scripts/com.gopeed",
    "~/Library/Containers/com.gopeed",
  ]
end
