cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.29.1"
  sha256 arm:   "1e3643afcbebab12c9666fbcc2cde79df52d266e52ad08661ffe33b209f5d7c1",
         intel: "191645958ba2249e8ad2f548ffff1b9e7e8853337693be421d26952654b26146"

  url "https://github.com/alist-org/desktop-release/releases/download/v#{version}/alist-desktop_#{version}_#{arch}.dmg",
      verified: "github.com/alist-org/"
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
