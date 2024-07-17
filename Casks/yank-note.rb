cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.73.1"
  sha256 arm:   "76af8a6475323f7057a7112e6b0bce128d38f2986a9e28577213ad3e06c4ae52",
         intel: "1a0b31c23a20e4ddba8dc4dc04d0b63dcc8d7f01190e3e054fae3cd633f59a2b"

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
