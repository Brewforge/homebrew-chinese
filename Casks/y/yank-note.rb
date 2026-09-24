cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.93.0"
  sha256 arm:   "71503b7ea6de7b4bac7821b4c4a50710eb3ce3a216bd7e37f838bbc6c3b4456b",
         intel: "3d0fa3ea2141bdadb6eaa6cb96145e015716806e00273bf12ee343f64c3d9f7e"

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
