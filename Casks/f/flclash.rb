cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.88"
  sha256 arm:   "1f60e382ebd0d8fde8a64cc95cb78ba0d4282112a0a1ccbf103c99be9aeb4d62",
         intel: "bbc4121a9692329cb43c6286a3fa67248279a64d812f801afcac9ce20fd54c11"

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
