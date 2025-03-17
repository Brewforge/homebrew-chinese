cask "nezha-agent" do
  arch arm: "arm64", intel: "amd64"

  os macos: "darwin", linux: "linux"

  version "1.7.3"
  sha256 arm:          "86dfe252135e953cb41a8e3e872d04f7ac1dfe95facbfbdb6393a0af335ae93f",
         x86_64:       "567a06e8b049e7373f022790d54aa05bcdf9741a37fd01d65a4687a52808a10e",
         arm64_linux:  "592008995d39aabfb3a313da86ffc4fecc4e2aea8ab0295006c8706d299c5f5b",
         x86_64_linux: "56a40362b8c8b5b47238932a76dc880d3a7a749c0b1c6626f66549dd5a27381f"

  url "https://github.com/nezhahq/agent/releases/download/v#{version}/nezha-agent_#{os}_#{arch}.zip",
      verified: "github.com/nezhahq/agent/"
  name "nezha-agent"
  desc "哪吒监控服务"
  homepage "https://nezha.wiki/"

  livecheck do
    url "https://github.com/nezhahq/agent"
    strategy :github_latest
  end

  binary "nezha-agent"
  service do
    run [opt_bin/"nezha-agent", "--password", ENV["HOMEBREW_NEZHA_AGENT_PASSWORD"].to_s, "--server",
         ENV["HOMEBREW_NEZHA_AGENT_SERVER"].to_s]
    keep_alive true
    environment_variables({
      HOMEBREW_NEZHA_AGENT_PASSWORD: ENV.fetch("HOMEBREW_NEZHA_AGENT_PASSWORD", nil),
      HOMEBREW_NEZHA_AGENT_SERVER:   ENV.fetch("HOMEBREW_NEZHA_AGENT_SERVER", nil),
    })
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
end
