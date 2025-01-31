class Ollamaplist < Formula
  desc "给 Ollama CLI 添加环境变量"
  homepage "https://github.com/Mrered/Gobin"
  version "0.2.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.2.4/ollamaplist_0.2.4_darwin_arm64.tar.gz"
    sha256 "f4275df70abefb206f3f2ad756e5420a6d8870d4d9b4b0b347769bd76f223d57"
  elsif OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.2.4/ollamaplist_0.2.4_darwin_amd64.tar.gz"
    sha256 "b8bc2b6b2c936680d2efd381897d2eb1285a99c3c6a95ad5fd353c0aed2120bd"
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end

  def install
    bin.install "ollamaplist"
  end

  def post_install
    chmod 0555, bin/"ollamaplist"
  end

  test do
    system bin/"ollamaplist", "-h"
  end
end
