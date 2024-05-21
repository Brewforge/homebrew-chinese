cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.70.2"
  sha256 arm:   "d66ba541e80bee90d40915cca8be3d8b2145836beec75d6a3c26b1f2f4b32dc3",
         intel: "676036ebca3afa8448e437110df586b6c58b71a9ca5eb825c1010ebd8883a641"

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
