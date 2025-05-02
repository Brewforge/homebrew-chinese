cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.84"
  sha256 arm:   "1029f3afe4c2c614ac9f461556ffccb353550a7e840ed379bfb3743e11d9732d",
         intel: "d1d6463482ea73f184b97c76d3ae2ba28239d33f4914b32c954b45b4be371e03"

  url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"
  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  livecheck do
    url :url
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
