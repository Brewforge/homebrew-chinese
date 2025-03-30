cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.82.1"
  sha256 arm:   "03644e14bbf22c33fdced54e05b8e13532e58d7f17de844c19975792eafabf74",
         intel: "f3b8be63b5613e74149e6f73a44b20167aeae6d5a0d19954ed449fa0d8435e37"

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
