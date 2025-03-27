cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.44.0"
  sha256 arm:   "23891c7f6a5234fa22a5539c15e1fe9256d379ff40cd4fd0108d3586b93afaff",
         intel: "183cfa9865eea758df1f3f707928ddff43fa78719471b2635f65df4cf3e04ef7"

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
