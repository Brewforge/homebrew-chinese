cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.70.4"
  sha256 arm:   "fe5fd167cc0dc37de857f23255ca9fac212b837984c3f61c680386c9c58ae168",
         intel: "cc259b96b512ce7dfa3fd0ee4133ec21cfee5afd0a4adb0d961a57c75741a766"

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
