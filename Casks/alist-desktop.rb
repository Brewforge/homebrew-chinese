cask "alist-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.31.0"
  sha256 arm:   "20f6234dfba2f18432e5d3227e3af3ea56d4a9af24a6d264a92566ba38f5ea94",
         intel: "3272e73daf7d44c77d29e3505c24150025fbe19822761741df162f1ad3cca423"

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
