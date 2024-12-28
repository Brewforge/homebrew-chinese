cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.78.2"
  sha256 arm:   "bff307b47f87b9c26f92f373a860c4b1c6dcef8a706757bb10fc58837105b268",
         intel: "bdf955c723093988f7dc2b9d0e02247c242600ab358dd2795b7ac75c1e29a183"

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
