cask "pot-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "2.7.5"
  sha256 arm:   "c1b29f0b479792b811830fbabd7eaab9e4ab828e3a702e4129abe29049179844",
         intel: "c29ce939a36037c3c8959fd4867ffb7e7cd2279f28dbe599dfacca807eebd423"

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
