cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.77.1"
  sha256 arm:   "8bf1d5a237fbc89ada20d5a17d8e61aa06a98683ca2f70f8ce7fad10de270eba",
         intel: "e49f50bba55295cfb8888cd32237a50eea0d22f1be7b07c031c223c181835640"

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
