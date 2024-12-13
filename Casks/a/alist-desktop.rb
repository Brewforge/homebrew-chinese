cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.41.0"
  sha256 arm:   "1d63497385f506cfe0a836d0e6945de5f6ca8db15f2666ddbbb845ffd4e6647c",
         intel: "f8ac5f42fef9d6ea2a81dd3680e69eb2c2c01ad6774eed327d4aad3d74d391b6"

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
