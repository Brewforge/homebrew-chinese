cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.4"
  sha256 arm:   "db0784e7e5a69fc93da85accf4d8d80812e7e014f2082609da395ba6124195c5",
         intel: "481f742112572a6488a5ec40ddd071283dc59eb4d91da1e399be25acaf79e8eb"

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
