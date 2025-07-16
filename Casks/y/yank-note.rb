cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.83.2"
  sha256 arm:   "cd9b78796fbeb34f3aebff8d1185302d16926f861153b1d3d7335a968ff1dac2",
         intel: "815b1ab2c5c2f5c4d6d2b0eab891bfbae51118ebb7ddaed41c514a5c1308b4b1"

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
