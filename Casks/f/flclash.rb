cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.3"
  sha256 arm:   "980e9cc3bd47d2090876e5e3c06f774e32a89330d83aa66ac3f8490e39924d9b",
         intel: "9738eebec4c8dd017bebb608f2d1e8c209cf5aa97cc4f181783036b66dd3c944"

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
