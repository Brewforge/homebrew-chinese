cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.33.0"
  sha256 arm:   "db8131be88872108db0b1c14f193a1b7a350dfa6e8e1f34166c01b46217400dc",
         intel: "fee7d3f2535bd0e84aab7e1863cc24ece041a81b25f0aed44b8ec2b18c2fd78a"

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
