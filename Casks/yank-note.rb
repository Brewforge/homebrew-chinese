cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.69.1"
  sha256 arm:   "c88a2dad227c8727414f1632565df82763e8ac97837df38525f01505072cbd00",
         intel: "14d3e0d6accc8c81e097a8bb6ecb0be7496138c1b9f9af68f19eb23a03518b55"

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
