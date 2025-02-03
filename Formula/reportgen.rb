class Reportgen < Formula
  desc "生成报告"
  homepage "https://github.com/Mrered/Gobin"
  version "0.3.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.3.0/reportgen_#{version}_darwin_arm64.tar.gz"
    sha256 "2b6786c3bc19af8d20d92d5be6f6b36ae6ce7d5177a3844cf1a5f7d7965baee2"
  elsif OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.3.0/reportgen_#{version}_darwin_amd64.tar.gz"
    sha256 "c702430eeea5b407440525bd2f287cf3491f26ebd1b8a31feb6ee8c8a1ba0cf1"
  elsif !OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.3.0/reportgen_#{version}_linux_arm64.tar.gz"
    sha256 "b1bfd8260de20c491e75774ddccd29ffd35b09aeecd211bc0299bcee0c7c146f"
  elsif !OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.3.0/reportgen_#{version}_linux_amd64.tar.gz"
    sha256 "e115c710cf766972f67d3d5824dd3de06ae212e5eeabfe9ae886cfa2651196b7"
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end

  def install
    bin.install "reportgen"
  end

  def post_install
    chmod 0555, bin/"reportgen"
  end

  test do
    system bin/"reportgen", "-h"
  end
end
