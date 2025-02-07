cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.81.3"
  sha256 arm:   "caaccd6df7364fccd60fc5c2e379ded76ce0c0750a97b5c17259a1b70df451d2",
         intel: "1d353c5a3e8c6f5361ccda25283a5965d911a74c09b5790ac05f5e7fa9365445"

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
