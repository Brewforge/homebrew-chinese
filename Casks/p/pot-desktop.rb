cask "pot-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.0.6"
  sha256 arm:   "7b66c51aadcf44201cc5eea9ecd1f1fefe11923488329f922fc5f3629be28276",
         intel: "4297c172b0bab10a9a5d62b2505aeaa1dfe7b3853522152b6fff6c766dba648f"

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
    "~/Library/Logs/com.pot-app.desktop",
    "~/Library/Saved Application State/cn.pylogmon.pot.savedState",
    "~/Library/Webkit/cn.pylogmon.pot",
    "~/Library/WebKit/com.pot-app.desktop",
  ]
end
