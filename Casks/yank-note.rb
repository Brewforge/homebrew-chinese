cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.64.2"
  sha256 arm:   "458e79f8cfc60bc06f623bea78900032e5daa1044ae32595f122687dcceea3d4",
         intel: "15e59dd568249a7ce81594cf793aa46c55679b89ecdeb739dbb8c7bbd50a59ce"

  url "https://github.com/purocean/yn/releases/download/v#{version}/Yank-Note-mac-#{arch}-#{version}.dmg",
      verified: "github.com/purocean/yn/"
  name "Yank Note"
  desc "Highly extensible Markdown editor"
  homepage "https://yank-note.com/zh-CN"

  livecheck do
    url :url
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
