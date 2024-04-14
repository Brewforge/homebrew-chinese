cask "pot-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "2.7.10"
  sha256 arm:   "c4911e6e9272cd4f68cde9eca61351e09cad7a51bdbd0850c325c83914a1c635",
         intel: "5806e016fca777812b57c812f3b5814b180a7822860e1e6f5f8bd592365e4fc9"

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
