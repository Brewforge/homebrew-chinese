cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.43.0"
  sha256 arm:   "deeb45c22bc17e017b4b8f5c702101ffaa5f14385748e27c07747032d9dbec8c",
         intel: "4eff6cd36ae4818aea21860388136b1ef1bfdf6b305010c42349bc43c8991de0"

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
