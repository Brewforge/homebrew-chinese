cask "aidea" do
  version "1.0.12"
  sha256 "60a4b4cff6e6c3a26639818797aafb518704c6d0c2caf99bb55062f73350d8c0"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/mylxsw/aidea/releases/download/#{version}/aidea-#{version}-macos.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "AIdea"
  desc "一款支持 GPT 以及国产大语言模型，以及 Stable Diffusion 的全能型 APP"
  homepage "https://ai.aicode.cc/"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  app "aidea.app"

  zap trash: []
end
