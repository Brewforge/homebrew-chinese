cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.98"
  sha256 arm:   "daaa8449f6b0e67ced7aa0472df2f15befbd5ed5944f36da4f90b0051a38ddb1",
         intel: "d72a5aea55e8514f742ab9567016f2e7d4c44e8c190012e291997e42c876c5e1"

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
