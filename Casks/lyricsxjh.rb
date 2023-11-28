cask "lyricsxjh" do
  version "1.6.4"
  sha256 "9cf58906156458c4179870313508a0542c648c9e824ad1cd17ce74bcdfe05b78"

  url "https://github.com/JH-Application-Forks/LyricsX/releases/download/v#{version}/LyricsX.zip"
  name "LyricsX_JH_Fork"
  desc "Ultimate Lyrics App"
  homepage "https://github.com/JH-Application-Forks/LyricsX"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "LyricsX.app"

  zap trash: [
    "~/Library/Application Scripts/com.JH.LyricsX",
    "~/Library/Application Scripts/com.JH.LyricsXHelper",
    "~/Library/Application Scripts/D5Q73692VW.group.com.JH.LyricsX",
    "~/Library/Group Containers/D5Q73692VW.group.com.JH.LyricsX",
    "~/Library/Containers/com.JH.LyricsXHelper",
    "~/Library/Containers/com.JH.LyricsX",
  ]
end
