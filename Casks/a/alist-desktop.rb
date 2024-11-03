cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.39.1"
  sha256 arm:   "ba0240a92e644f06bd9653ae871dc35124d6c31947a84637dff3b67feebf5671",
         intel: "415c44e5c4ac54bc101fee72e3c34b0834c34eca5f75e43f3ccd9dbbdc9551e3"

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
