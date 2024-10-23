cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.38.0"
  sha256 arm:   "cb2058832e93a69cf1b6d4c0fab43cd7baef77d208e4a6c6c13cfefd25c5bb48",
         intel: "523c9ffa4eda0a8657000d708acd733dbb4fc094cf0804a1cf21290706c8a97e"

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
