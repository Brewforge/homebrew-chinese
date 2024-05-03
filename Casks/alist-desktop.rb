cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.34.0"
  sha256 arm:   "55d39d385b7a28f8d1127a26e66c5d5bdfbe2c3898ea624dea98ff52a6614dc5",
         intel: "6010df1646176b964c2ad8fba32f189aff9c0d04018161d330971fa33fe06615"

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
