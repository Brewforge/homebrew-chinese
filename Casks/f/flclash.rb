cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.73"
  sha256 arm:   "6c32fc4006c9fe92565e58f4e2939e9e1f09c6e6ee9d54a27a9a72b12e4954d8",
         intel: "f27007280f69f43c6d6a33aaf0fb1828d2d31f8d04fd40697fab58de62197b94"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true

  app "FlClash.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/FlClash.app"]
  end

  zap trash: [
    "/private/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.clash.follow",
    "~/Library/Application Support/com.clash.follow",
    "~/Library/Preferences/com.clash.follow.plist",
    "~/Library/Saved Application State/com.clash.follow.savedState",
  ]
end
