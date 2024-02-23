cask "aidea" do
  version "1.0.13"
  sha256 "3cbc37f807c740ec99ab1c0cab30b077ca596dba301333a8b44a8c06a6d74983"

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
