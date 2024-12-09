cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.70"
  sha256 arm:   "ccc113f59963255c9caca79a109962c73869e9e05ee283d44a6507acee4f62cf",
         intel: "119dc53d47f62bc67486102e985d35f6f052c7e40c4c7a380683cc2c85b71887"

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
