cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.32.0"
  sha256 arm:   "a6ccffa9c9320a67db5e06822f7d333b5ea9fe6a4c06c531c489ab67330a8a81",
         intel: "2e3c444c97a3e81488f58278648338125e225a5941ae94ec0a75f1a0ff9e356a"

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
