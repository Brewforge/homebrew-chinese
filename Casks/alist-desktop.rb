cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.30.1"
  sha256 arm:   "74287538edb88c23b08f9326872f08e01d2bf750e82e5d993dbc136f71105a60",
         intel: "cb6440ff937e955a00d61e4d3dd99b510c426f2c0ced004226fb40b8ec0305b0"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/alist-org/desktop-release/releases/download/v#{version}/alist-desktop_#{version}_#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "AList-Desktop"
  desc "File list program that supports multiple storage, powered by Gin and Solidjs"
  homepage "https://alist.nn.ci/zh/"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true

  app "alist-desktop.app"

  zap trash: [
    "~/Library/Application Support/ci.nn.alist",
    "~/Library/Caches/ci.nn.alist",
    "~/Library/Saved Application State/ci.nn.alist.savedState",
    "~/Library/Webkit/ci.nn.alist",
  ]
end
