cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.74.0"
  sha256 arm:   "716a465d0f67ff72af38d34d1847c488d01d2262e69c28e736f19bf8b419b7f0",
         intel: "b5539bcd444977f66ccc72f33cdb5c54ade0e844250d9f121ba86134ac72a987"

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
