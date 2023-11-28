cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.63.2"
  sha256 arm:   "fd58db618bbd58e8ea0cc02613e2c4bb394e346056c357fd4f51c0b055a4b8fc",
         intel: "bfaefe6d01df3e2ba273031d5e19b36be43b7453014c215b0e2c2c820279f411"

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
