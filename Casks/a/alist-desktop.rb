cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.45.0"
  sha256 arm:   "e79f9a8a8de4ed788bb6de2879a912c60ce2fd60314faeb27f226ba10c1245f0",
         intel: "4ac6f707da7aa7c413b67c1a84fafdccf76dd93d08dc1c48624bf56b33fb0501"

  url "https://github.com/alist-org/desktop-release/releases/download/v#{version}/alist-desktop_#{version}_#{arch}.dmg",
      verified: "github.com/alist-org/desktop-release/"
  name "AList-Desktop"
  desc "File list program that supports multiple storage, powered by Gin and Solidjs"
  homepage "https://alist.nn.ci/zh/"

  livecheck do
    url :url
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
