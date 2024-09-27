cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.62"
  sha256 arm:   "b8e0f7efdc9ca01e5ed2e6b5fdbca1348aa1ebece93ef426dff4ac504c8d8f05",
         intel: "51a72892ddadd595c48ecebe4be4da6085a99f4dc9cf049e085d12b328e8ed51"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  livecheck do
    url origin.to_s
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
