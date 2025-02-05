class Makemf < Formula
  desc "为 GGUF 文件生成 Makefile"
  homepage "https://github.com/Mrered/Gobin"
  url "https://github.com/Mrered/Gobin/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "cb2ec711ca053d68eb1ff585701c6fd1c3c6d84b006cec21ffd117dc617e3068"
  license "MIT"
  head "https://github.com/Mrered/Gobin.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/makemf"
  end

  test do
    system bin/"makemf", "-v"
  end
end
