class Ollamaplist < Formula
  desc "给通过 Homebrew 安装的 Ollama CLI 工具添加环境变量"
  homepage "https://github.com/Mrered/Gobin"
  url "https://github.com/Mrered/Gobin/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "cb2ec711ca053d68eb1ff585701c6fd1c3c6d84b006cec21ffd117dc617e3068"
  license "MIT"
  head "https://github.com/Mrered/Gobin.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/ollamaplist"
  end

  test do
    system bin/"ollamaplist", "-v"
  end
end
