cask "aidea" do
  version "2.0.0"
  sha256 "b87710e26b55ae0025539b1e8bb56aad8abc436e3929dee609cc085f2ffb1c20"

  url "https://github.com/mylxsw/aidea/releases/download/#{version}/aidea-#{version}-macos.dmg",
      verified: "github.com/mylxsw/aidea/"
  name "AIdea"
  desc "一款支持 GPT 以及国产大语言模型，以及 Stable Diffusion 的全能型 APP"
  homepage "https://ai.aicode.cc/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "aidea.app"

  zap trash: [
    "~/.aidea",
    "~/Library/Application Support/cc.aicode.flutter.askaide.askaide",
    "~/Library/Caches/cc.aicode.flutter.askaide.askaide",
    "~/Library/Saved Application State/cc.aicode.flutter.askaide.askaide.savedState",
  ]
end
