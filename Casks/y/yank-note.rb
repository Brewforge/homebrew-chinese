cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.92.1"
  sha256 arm:   "696011133d6d11b9d359035f918d9122e2de06cc840e9e5fe6c14436a524557d",
         intel: "fdbdd6562e9ed006828d68e61e4d1535842486cc8d95b5ea884c8c887dafca05"

  url "https://github.com/purocean/yn/releases/download/v#{version}/Yank-Note-mac-#{arch}-#{version}.dmg",
      verified: "github.com/purocean/yn/"
  name "Yank Note"
  desc "高可扩展性 Markdown 笔记软件"
  homepage "https://yank-note.com/zh-CN"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Yank Note.app"

  zap trash: [
    "~/Library/Application Support/yank.note",
    "~/Library/Logs/yank.note",
    "~/Library/Preferences/yank.note.plist",
    "~/Library/Saved Application State/yank.note.savedState",
  ]
end
