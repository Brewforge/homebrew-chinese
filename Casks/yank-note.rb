cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.72.2"
  sha256 arm:   "5592cec3a194609671f1cb44f96bb6ab91b775052b7e16d64d7da1236a53ca3c",
         intel: "9d734fbc49964b0ada851a690a47bd891322bd8fef741904b668650007193947"

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
