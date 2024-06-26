cask "pot-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "3.0.4"
  sha256 arm:   "b4ee762bae80c208b8ff413ee5f81d818da4e63b561618ad878df83d1cdae5e2",
         intel: "d9474707b0f235a220ed963475f8d618a07c30c515e6a4cc14a7bc4caeed9200"

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
