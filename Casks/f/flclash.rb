cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.1"
  sha256 arm:   "ef904fb991a9ed5f0deaedb0a66f4a45dccfceeb45225d602fad3f2246aa9b99",
         intel: "01bf8bc434a7f035fe2c27736f061c3cb7721e63771000277711840dde0d5219"

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
