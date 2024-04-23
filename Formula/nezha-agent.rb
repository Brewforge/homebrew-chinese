class NezhaAgent < Formula
  desc "哪吒监控服务"
  homepage "https://nezha.wiki/"
  version "0.16.5"
  license "Apache-2.0"

  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  if OS.mac?
    url "https://github.com/nezhahq/agent/releases/download/v#{version}/nezha-agent_darwin_#{arch}.zip"
    if Hardware::CPU.arm?
      sha256 "975cad66a69310d572dcaaabacb9679cc6dc87041d23d0ae364a47f7f6343c39"
    else
      sha256 "b3ffb7edffb7926df8e053dff4b709e4a599a366f4bbde1c73c1a003c178eb33"
    end
  end

  service do
    run [opt_bin/"nezha-agent", "--password", ENV['HOMEBREW_NEZHA_AGENT_PASSWORD'], "--server", ENV['HOMEBREW_NEZHA_AGENT_SERVER']]
    keep_alive true
  end

  livecheck do
    url "https://github.com/nezhahq/agent/releases"
    strategy :github_latest
  end

  def caveats
    <<~EOS
      请先添加环境变量
      echo 'export HOMEBREW_NEZHA_AGENT_PASSWORD="你的密钥，在你的服务页面获取"' >> ~/.zshrc
      echo 'export HOMEBREW_NEZHA_AGENT_SERVER="你的服务器和端口，同上"' >> ~/.zshrc
    EOS
  end

  def install
    bin.install "nezha-agent"
  end
end
