cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.66.1"
  sha256 arm:   "34b2d4e1b02fa37a5943ea90a8fdb11ef39e33813c820553678a8429e3226249",
         intel: "6c3c28ce9eb05b53f82c559c19a4c5fa0310ef3eb7bda95b58139ba823521cb7"

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
