cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.37.0"
  sha256 arm:   "ae26347e0920579d5841ce343b0560188f0fba7a95baf693e0ac9e7179fd46a1",
         intel: "b3bfdbf00812a94a6d4b76ea8d6251228b0c33cbcd04fa717b6a580644b846d9"

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
