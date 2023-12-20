cask "pot-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "2.7.2"
  sha256 arm:   "43139a063d2d49341cab83555e38e43dd0346b3e4426bbdef49cd945044ec408",
         intel: "4e0d4799e62ae432770650834c099bd448d1d6125c058ef8dacbd5d7f39860a7"

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
    "~/Library/Saved Application State/cn.pylogmon.pot.savedState",
    "~/Library/Webkit/cn.pylogmon.pot",
    "~/Library/WebKit/com.pot-app.desktop",
  ]
end
