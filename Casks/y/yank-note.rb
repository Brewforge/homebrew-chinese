cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.93.1"
  sha256 arm:   "15b85312ba8e8b6db69dd13e05e388c78c3060042cca674e41f9e07d32da0526",
         intel: "348a00d36aa13692d83eb379bfb576b2af9114b22e82c9843fc954b3ba860e94"

  url "https://github.com/purocean/yn/releases/download/v#{version}/Yank-Note-mac-#{arch}-#{version}.dmg"
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
