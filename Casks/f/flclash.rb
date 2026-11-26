cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.5"
  sha256 arm:   "0a350209c2a1ef8d181a3d0dd563ae8f86aece161f5a4e8554683caf5020bd82",
         intel: "69d68de2c4da721e554d03f9529521afb4b75334d87306be8906416e6af6fab8"

  url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"
  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "FlClash.app"

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/FlClash.app"]
  end

  zap trash: [
    "/private/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.clash.follow",
    "~/Library/Application Support/com.clash.follow",
    "~/Library/Preferences/com.clash.follow.plist",
    "~/Library/Saved Application State/com.clash.follow.savedState",
  ]
end
