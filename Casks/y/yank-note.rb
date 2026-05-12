cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.89.1"
  sha256 arm:   "cf1348b5068caaeb898c0f9c1cb29de6354d79699e1e4bf26f29efc7a3ed8695",
         intel: "0c4a970a5dd4850582baf117ae465d56d557be9732476c72068a63fa2f2dc93a"

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
