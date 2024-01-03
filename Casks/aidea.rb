cask "aidea" do
  version "1.0.10"
  sha256 "c61979cda677c8a4a5d4f05a69f11b25e04ef785bb88fdbeff08b90f49d703eb"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/mylxsw/aidea/releases/download/#{version}/aidea-#{version}-macos.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "AIdea"
  desc "一款支持 GPT 以及国产大语言模型通义千问、文心一言等，支持 Stable Diffusion 文生图、图生图、SDXL1.0、超分辨率、图片上色的全能型 APP"
  homepage "https://ai.aicode.cc/"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  app "aidea.app"

  zap trash: []
end
