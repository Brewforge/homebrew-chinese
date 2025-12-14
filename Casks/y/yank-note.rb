cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.86.1"
  sha256 arm:   "f43914fa9c7b8e829248cbc2e19d64959d1a4144cf66638ff482113eaac24190",
         intel: "31abeba82beebfcce42f4d66a05923d84af445dfefabe9eaa67c5c31efed751f"

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
