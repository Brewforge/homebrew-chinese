cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.81.2"
  sha256 arm:   "ef9ff34096e2654dbb143ec470c91d0867785d939d298cf871145f958d22f64b",
         intel: "ccfaa78c06680fe4d9f7e2ef5cb4005fcbe87dd8ef501080763285647c484635"

  url "https://github.com/purocean/yn/releases/download/v#{version}/Yank-Note-mac-#{arch}-#{version}.dmg"
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
