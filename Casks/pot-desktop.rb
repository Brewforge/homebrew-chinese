cask "pot-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "2.7.0"
  sha256 arm:   "93a12da240a190aaee79ee9315db28cac2e96183d2c5b4ffe6c20eaf10f06094",
         intel: "a2da86edbf8b6e88f961f6992e4d42d8229698a445b525d262743207271d0930"

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
  ]
end
