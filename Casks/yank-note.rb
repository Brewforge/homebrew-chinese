cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.75.4"
  sha256 arm:   "240e5580f314dbf8854c8c2e8ba8f962f59215289a9b71abdcadce4bf57c9177",
         intel: "7a80580e7efe134165f3b47d1d89b2525f096f0106e95251be4aab929e61f8e3"

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
