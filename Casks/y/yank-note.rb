cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.90.0"
  sha256 arm:   "74841b23767d88f5c09914c9be1373842e40732307ee65a94554ba0dce3d1ce0",
         intel: "4fbd79c93d77f8c56b7ff69d1fa8e62b604faadcf898a5239b3e7e0ec16e63d5"

  url "https://github.com/purocean/yn/releases/download/v#{version}/Yank-Note-mac-#{arch}-#{version}.dmg",
      verified: "github.com/purocean/yn/"
  name "Yank Note"
  desc "高可扩展性 Markdown 笔记软件"
  homepage "https://yank-note.com/zh-CN"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Yank Note.app"

  zap trash: [
    "~/Library/Application Support/yank.note",
    "~/Library/Logs/yank.note",
    "~/Library/Preferences/yank.note.plist",
    "~/Library/Saved Application State/yank.note.savedState",
  ]
end
