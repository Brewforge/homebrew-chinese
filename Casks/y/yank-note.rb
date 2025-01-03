cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.79.1"
  sha256 arm:   "c7894d03ccdfc6d547e35bca68deee98140f235d2cf7aed2e5ce1fbd9231e6ef",
         intel: "de787bdf2b5182068bb192feedd10d7236c72b69f00280d1ed4a12e499e687d6"

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
