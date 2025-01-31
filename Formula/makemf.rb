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
    sha256 "a9a4a1e0ae92d996a7db3da6d4bb84bce689963b1d1083e0f26569ad939013d9"
  elsif !OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.2.3/makemf_0.2.3_linux_arm64.tar.gz"
    sha256 "e75a5fa805f2cd383f7f1ae0a6f8065eb38fdf41d59607d44abd675a9419a23d"
  elsif !OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/Mrered/Gobin/releases/download/v0.2.3/makemf_0.2.3_linux_amd64.tar.gz"
    sha256 "56a40362b8c8b5b47238932a76dc880d3a7a749c0b1c6626f66549dd5a27381f"
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
