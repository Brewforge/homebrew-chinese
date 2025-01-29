class Ollamaplist < Formula
  desc "给 Ollama CLI 添加环境变量"
  homepage "https://github.com/Mrered/Gobin"
  version "0.2.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.2.3/ollamaplist_#{version}_darwin_arm64.tar.gz"
    sha256 "b36aa988ea59cf11b9fd3954e4b3720dd9b8d225099253466e932ce7f81a9dd9"
  elsif OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.2.3/ollamaplist_#{version}_darwin_amd64.tar.gz"
    sha256 "7610f44bd80659d3fb6c8a05cd51f399a91607e7bb5bfebdde4b52599b2ba2f9"
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
