cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.78"
  sha256 arm:   "69c7648fa4f8a3e6461cd87026f84b110c71642f33528ab995b579d17fd65f17",
         intel: "1babbd6659630358a72c4db395c38e6d7be5357daae3f5f8213747a1b85106a7"

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
