cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.85"
  sha256 arm:   "39db2244b4c5e30cd57747c069622d8237725c5e6edd6c4ac977d1c5c0c293f9",
         intel: "01cd5adbb32ae6c5e9c7b86a6867493446d05c6e1b8df68cde2d539462aa13e7"

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
