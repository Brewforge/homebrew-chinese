cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.78.1"
  sha256 arm:   "7eb303e9f0a9403f5ef681b0ff1d0bc8d82e1d6473ad19e35983d23562aa05ac",
         intel: "524b806c5de2f1f653af24e6ff0acd89420b34a847678a6df47dcca304aecef6"

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
