cask "pot-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "2.7.1"
  sha256 arm:   "436caf3bf0ff075961992f9962e50b60ee5760b9ba07994f2bd7e46c7b87d5e9",
         intel: "3c623cf7dc89f4ec0cb30db1f2f231ebff48a1496dccadda207a78e86da620a8"

  url "https://github.com/pot-app/pot-desktop/releases/download/#{version}/pot_#{version}_#{arch}.dmg"
  name "pot"
  desc "Cross-platform translation software"
  homepage "https://github.com/pot-app/pot-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "pot.app"

  zap trash: [
    "~/Library/Application Support/cn.pylogmon.pot/config.toml",
    "~/Library/Caches/cn.pylogmon.pot",
    "~/Library/Saved Application State/cn.pylogmon.pot.savedState",
    "~/Library/Webkit/cn.pylogmon.pot",
    "~/Library/WebKit/com.pot-app.desktop",
  ]
end
