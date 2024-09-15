cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.76.2"
  sha256 arm:   "aa4c11278a98d77fef9c66b8c3e8c39bb85e6f2b8664d86926c4e64330867045",
         intel: "cec31160132e976223a5f285f1d31921d1d8fb123e382c99fa1d50d3f2653051"

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
