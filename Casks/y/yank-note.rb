cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.81.0"
  sha256 arm:   "06aff922090d47340f96d5b0cea353a293f259aa322b975981b59f40806a962c",
         intel: "bc5fdd12cbf121dd015539afa8d6d49cbf148ec2ed34953e82c19bba1cfb48c1"

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
