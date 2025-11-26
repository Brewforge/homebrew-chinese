cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.85.1"
  sha256 arm:   "e9320a4c3c0fef8f76b63331a2939b0ade8ef07c2abcccff0117135e9dadb747",
         intel: "b80f87619308e8f5ca5874b8cfa8f4823ae7fc87d05b375b675473e5b4b682eb"

  url "https://github.com/purocean/yn/releases/download/v#{version}/Yank-Note-mac-#{arch}-#{version}.dmg",
      verified: "github.com/purocean/yn/"
  name "Yank Note"
  desc "高可扩展性 Markdown 笔记软件"
  homepage "https://yank-note.com/zh-CN"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Yank Note.app"

  zap trash: [
    "~/Library/Application Support/yank.note",
    "~/Library/Logs/yank.note",
    "~/Library/Preferences/yank.note.plist",
    "~/Library/Saved Application State/yank.note.savedState",
  ]
end
