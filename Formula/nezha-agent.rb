class NezhaAgent < Formula
  desc "哪吒监控服务"
  homepage "https://nezha.wiki/"
  version "0.16.9"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nezhahq/agent/releases/download/v0.16.9/nezha-agent_darwin_arm64.zip"
    sha256 "b1629dcdc065d847d591548b906cc65021d72be81108650847ff3c52edc635c5"
  elsif OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/nezhahq/agent/releases/download/v0.16.9/nezha-agent_darwin_amd64.zip"
    sha256 "b3ffb7edffb7926df8e053dff4b709e4a599a366f4bbde1c73c1a003c178eb33"
  end

  service do
    run [opt_bin/"nezha-agent", "--password", (ENV["HOMEBREW_NEZHA_AGENT_PASSWORD"]).to_s, "--server",
         (ENV["HOMEBREW_NEZHA_AGENT_SERVER"]).to_s]
    keep_alive true
    environment_variables({
      HOMEBREW_NEZHA_AGENT_PASSWORD: ENV["HOMEBREW_NEZHA_AGENT_PASSWORD"],
      HOMEBREW_NEZHA_AGENT_SERVER:   ENV["HOMEBREW_NEZHA_AGENT_SERVER"],
    })
  end

  livecheck do
    url "https://github.com/nezhahq/agent/releases"
    strategy :github_latest
  end

  def install
    bin.install "nezha-agent"
  end

  def caveats
    <<~EOS
      请先添加环境变量
        echo 'export HOMEBREW_NEZHA_AGENT_PASSWORD="你的密钥，在你的服务页面获取"' >> ~/.zshrc
        echo 'export HOMEBREW_NEZHA_AGENT_SERVER="你的服务器和端口，格式 your.domain:5555 "' >> ~/.zshrc
        source ~/.zshrc
      再安装本命令行服务，否则会导致无法向服务配置中初始化密钥和服务器参数。

      若已安装，并遇到错误，则请运行
        brew services stop nezha-agent
        brew reinstall nezha-agent
        brew services start nezha-agent
    EOS
  end

  test do
    system bin/"nezha-agent", "-h"
  end
end
