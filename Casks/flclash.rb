cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.59"
  sha256 arm:   "8169ab620b66ca02518ccfc987d51d7f56ae41b4726bc8bdbdeff3fcd432707a",
         intel: "a4d4ff4e9fbe7ab1a73e151451f0b8b599dd97702e9d5706bb08c2d962bceeac"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "FlClash"
  desc "A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free"
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
