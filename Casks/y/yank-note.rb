cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.83.1"
  sha256 arm:   "f3e736e02e5926c613c296d3929a5afb7de858fab629217a72efdcce85e733f3",
         intel: "49318e521f84c72344dbf9f48a211b93764937c364f9852d50e440f458ceaf17"

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
