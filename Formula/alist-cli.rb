class AlistCli < Formula
  desc "File list program that supports multiple storage, powered by Gin and Solidjs"
  homepage "https://github.com/alist-org/alist"

  if OS.mac? && Hardware::CPU.arm?
    url "https://mirror.ghproxy.com/https://github.com/alist-org/alist/releases/download/v3.29.1/alist-darwin-arm64.tar.gz", verified: "mirror.ghproxy.com/"
    sha256 "78b6d3071b6ef8afbb8d2c3c4fdc88627f1e0e1fa61e76675fd4731596c2c965"
  elsif OS.mac? && !Hardware::CPU.arm?
    url "https://mirror.ghproxy.com/https://github.com/alist-org/alist/releases/download/v3.32.0/alist-darwin-amd64.tar.gz", verified: "mirror.ghproxy.com/"
    sha256 "9606ea37412285fd3a4f8a2bd5b04271f3c2dfa0af2c0a76bbbce57402a88083"
  elsif !OS.mac? && Hardware::CPU.arm?
    url "https://mirror.ghproxy.com/https://github.com/alist-org/alist/releases/download/v3.29.1/alist-linux-arm64.tar.gz", verified: "mirror.ghproxy.com/"
    sha256 "606a6bcff1abd25bd5aaaf9663b62bfd3281e575dda9df1852b2e48f23511cae"
  elsif !OS.mac? && !Hardware::CPU.arm?
    url "https://mirror.ghproxy.com/https://github.com/alist-org/alist/releases/download/v3.29.1/alist-linux-amd64.tar.gz", verified: "mirror.ghproxy.com/"
    sha256 "81f66e521fe48cb18daadab2d175116201d3ef6b5d5d7bbac1835493eb6e1c81"
  end

  version "3.32.0"
  license "AGPL-3.0"

  livecheck do
    url "https://github.com/alist-org/alist/releases"
    strategy :github_latest
  end

  def install
    bin.install "alist"
  end
end
