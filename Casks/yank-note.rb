cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.76.1"
  sha256 arm:   "f1b69f76ae4958bfb81d23072386c56cb0ba701d6c3baffb4ff5ab1521166009",
         intel: "5503fc344e6d4277b964bce3b58880916bb7b6a61e8de7a2e1f66d92cd1bf40b"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/purocean/yn/releases/download/v#{version}/Yank-Note-mac-#{arch}-#{version}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "Yank Note"
  desc "高可扩展性 Markdown 笔记软件"
  homepage "https://yank-note.com/zh-CN"

  livecheck do
    url origin.to_s
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
