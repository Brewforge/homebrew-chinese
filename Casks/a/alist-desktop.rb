cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.37.3"
  sha256 arm:   "0b8fff88fa61c5d4f0eb664401459f8cc02f7743c296c81ba9a8c5851957a157",
         intel: "684c10dbc50b58a0cc6ab6a31c1d1dfc3c9525f4d1096970f83dd844464a4d12"

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
