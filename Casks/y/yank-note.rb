cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.80.4"
  sha256 arm:   "34d9536c5b323497368700c281f5dfc64328d18273387f5efa49592f1ebea24a",
         intel: "0740fb5864054258be32c1c145afbca4f13f6e2b9b97adb2f0eb9504b10d2fc5"

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
