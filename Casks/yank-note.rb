cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.70.3"
  sha256 arm:   "5f674779ae61aff885e35c4667e13e82efe1a2eebe850f0232d0444ac593457f",
         intel: "6ab465e502002dcce5868784672680b4fe7a931ec59739ebf60fa9958b192750"

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
