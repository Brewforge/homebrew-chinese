cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.77"
  sha256 arm:   "258d5a07cb3559e7e188e1648cb9627893dbad7ca2741905a2b03eca2c0ec51f",
         intel: "daedf61ec1b573f32b50a6debd2004df0594b72b5a1818a28650f568053b37fc"

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
