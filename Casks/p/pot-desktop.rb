cask "pot-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.0.7"
  sha256 arm:   "b3561a92ab5bf338291c25b42bf2eb30bf4b013be379d78ffb275edbb899b0a9",
         intel: "9ce47c9488126d3bdffbb0ec66c2979f4b9d759eb60078127cb294fd6fd07024"

  url "https://github.com/pot-app/pot-desktop/releases/download/#{version}/pot_#{version}_#{arch}.dmg"
  name "pot"
  desc "Cross-platform software for text translation and recognition."
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
