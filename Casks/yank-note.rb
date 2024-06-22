cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.71.1"
  sha256 arm:   "b8c006f75ae261e3d2a7f11aba30230d46a9cdf8281d1ec7968ee9884f23b9dd",
         intel: "6d1cbce01607d44d4f13a4eb048bccaa43322c3b0c29fb684ada97ea164a931e"

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
