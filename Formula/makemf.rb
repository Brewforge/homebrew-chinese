class Makemf < Formula
  desc "让 GGUF 在 Ollama 中运行"
  homepage "https://github.com/Mrered/Gobin"
  version "0.2.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.2.4/makemf_0.2.4_darwin_arm64.tar.gz"
    sha256 "c09a6bc634e3b90f6f52e3b6711aa27fc8aec3cf7ae59acc897ae9a965be32f6"
  elsif OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.2.3/makemf_0.2.3_darwin_amd64.tar.gz"
    sha256 "2f6f5312c85b832b9c4397c779cd1168547afb99e0dc6226ab933512bcc6ec53"
  elsif !OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.2.3/makemf_0.2.3_linux_arm64.tar.gz"
    sha256 "6a00351436126ca5b0fde825ab3b90ef2edb1345c5f8d3226512b09756f627d0"
  elsif !OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.2.3/makemf_0.2.3_linux_amd64.tar.gz"
    sha256 "0020268aff143c9d4fa69b595f57344674791f902f4ea5efad0bb3c607e25aca"
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end

  def install
    bin.install "makemf"
  end

  def post_install
    chmod 0555, bin/"makemf"
  end

  test do
    system bin/"makemf", "-h"
  end
end
