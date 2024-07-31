cask "aidea" do
  version "1.0.15"
  sha256 "61b2e3cacdf08d09c7aa3726e6b0fc14c752c05dec4e7afdeb237f3c5b39f55a"

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
