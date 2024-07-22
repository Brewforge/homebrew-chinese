cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.36.0"
  sha256 arm:   "a119f592b664e4d04657896a4e83a9704360afad886f68c962e9d30121178711",
         intel: "7e04d2182ad8740c7ecb876385d212b373c3c4d64278417ee08604bfa26ca7b8"

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
