cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.65.0"
  sha256 arm:   "7d6f86e6111920ccc10d16f4a6cb7342116afb498ac99f3de95f98c2ae5505af",
         intel: "7a16ac1582490ed086a0f16df4e6aa9d6671d8fd37b6571281c2e6e5af630449"

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
    "~/Library/Saved Application State/yank.note.savedState",
    "~/Library/Preferences/yank.note.plist",
    "~/Library/Logs/yank.note",
  ]
end
