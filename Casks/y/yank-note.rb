cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.84.0"
  sha256 arm:   "69e24de0571cd33815a9262824572188adbedd1ea28ccb9f08518b1f9aa1e6cc",
         intel: "1edaa5e455905b0002fd13ab299969e33436007cc8312099b6b1ad952e7e596a"

  url "https://github.com/purocean/yn/releases/download/v#{version}/Yank-Note-mac-#{arch}-#{version}.dmg",
      verified: "github.com/purocean/yn/"
  name "Yank Note"
  desc "高可扩展性 Markdown 笔记软件"
  homepage "https://yank-note.com/zh-CN"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Yank Note.app"

  zap trash: [
    "~/Library/Application Support/yank.note",
    "~/Library/Logs/yank.note",
    "~/Library/Preferences/yank.note.plist",
    "~/Library/Saved Application State/yank.note.savedState",
  ]
end
