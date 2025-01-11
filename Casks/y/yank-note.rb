cask "yank-note" do
  arch arm: "arm64", intel: "x64"

  version "3.80.2"
  sha256 arm:   "39fda64b3d3ca9b3acf89f1fd4faf1bce708710ee01b468eff942b331a134f11",
         intel: "0ea5f7a8605a829ac3f0dce7550252f774324f5f219671d7b1269d5ba7ee2bb3"

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
