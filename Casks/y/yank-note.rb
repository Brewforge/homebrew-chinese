cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.88.2"
  sha256 arm:   "0e32c4726fd3f0ad6a255b6734ae8da520ef3fcae7e828ff628f2ec27da0465c",
         intel: "13e3e6499721a3f4adeae5c6dd444cc997bc01f00da6f385ca37a52cc21c797f"

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
