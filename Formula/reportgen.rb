class Reportgen < Formula
  desc "生成报告"
  homepage "https://github.com/Mrered/Gobin"
  url "https://github.com/Mrered/Gobin/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "cb2ec711ca053d68eb1ff585701c6fd1c3c6d84b006cec21ffd117dc617e3068"
  license "MIT"
  head "https://github.com/Mrered/Gobin.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/reportgen"
  end

  test do
    system bin/"reportgen", "-v"
  end
end
