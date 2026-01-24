cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.87.1"
  sha256 arm:   "01c394229597a58bcc533e6580ca4122459f913573a809a0d381af8b7dd97e06",
         intel: "07f3daecab1b27fad453af3cabff8061c6664abd65c7fed31d3fc445bd077ac9"

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
