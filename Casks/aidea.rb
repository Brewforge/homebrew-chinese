cask "aidea" do
  version "1.0.14"
  sha256 "d6317ba091818bc67964ccf0dd4830e1f7f555416d43c929c6027c071c1e4097"

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
