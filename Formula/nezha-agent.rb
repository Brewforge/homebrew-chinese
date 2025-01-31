class NezhaAgent < Formula
  desc "哪吒监控服务"
  homepage "https://nezha.wiki/"
  version "1.7.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nezhahq/agent/releases/download/v1.7.0/nezha-agent_darwin_arm64.zip"
    sha256 "99be61c28d99aceda9f8353ba6f3387f8a1a3f8a71ca4e99b301501de58369a6"
  elsif OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/nezhahq/agent/releases/download/v1.6.1/nezha-agent_darwin_amd64.zip"
    sha256 "9413f14b38662885419ef9b08da268a298f16647a451f6f239370a404fedab21"
  elsif !OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nezhahq/agent/releases/download/v1.6.1/nezha-agent_linux_arm64.zip"
    sha256 "592008995d39aabfb3a313da86ffc4fecc4e2aea8ab0295006c8706d299c5f5b"
  elsif !OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/nezhahq/agent/releases/download/v1.6.1/nezha-agent_linux_amd64.zip"
    sha256 "56a40362b8c8b5b47238932a76dc880d3a7a749c0b1c6626f66549dd5a27381f"
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
