cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.68.0"
  sha256 arm:   "4bf5cce8130e976a87401ac0a192f7032d73b8224cdd2601e06a392f2be93d8d",
         intel: "13170fd61e639a6236ea184be813eccadeb23cf70a0de6c2a7743b35b313214b"

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
