cask "pot-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "2.7.6"
  sha256 arm:   "a7e3c80ac8fc46585c4d239f26b44f98c854e4a7f07c130dff6f101013b36bfe",
         intel: "3208cf71390cab15f2ae6310b30d056ff33228ef27bea2f20ce89a7c0af7c1c1"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/pot-app/pot-desktop/releases/download/#{version}/pot_#{version}_#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "pot"
  desc "Cross-platform translation software"
  homepage "https://github.com/pot-app/pot-desktop"

  livecheck do
    url origin.to_s
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
