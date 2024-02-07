cask "gopeed" do
  version "1.5.5"
  sha256 "2aec65f026896c6db5de5bad68ae8821847d0f33ae2c0fc1fbfd82a6ef26e0b8"

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
