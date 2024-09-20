cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.61"
  sha256 arm:   "f49b94e518e2add5df6bcff4d3c2c82d72a547f1667e9600a3c3d3f1987f05e1",
         intel: "67aab5973c93401ea8af615b5f0b6a077f6577f26bc18e19e38dbd3405fdb57d"

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
