cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.94"
  sha256 arm:   "3acab87eacb1f209afd873f9d85cbdbabd88ee59a935f9ecde9222b08f74fd79",
         intel: "6b284abe88e2e57a5f5b22bf87b28b194d9df37b3e3f8f803905fefe83c0e4b6"

  url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"
  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

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
