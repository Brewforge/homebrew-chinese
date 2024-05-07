class AlistCli < Formula
  desc "File list program that supports multiple storage, powered by Gin and Solidjs"
  homepage "https://github.com/alist-org/alist"
  version "3.33.0"
  license "AGPL-3.0"

  mirror = "https://mirror.ghproxy.com/"
  if OS.mac? && Hardware::CPU.arm?
    origin = "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-arm64.tar.gz"
    sha256 "78b6d3071b6ef8afbb8d2c3c4fdc88627f1e0e1fa61e76675fd4731596c2c965"
  elsif OS.mac? && !Hardware::CPU.arm?
    origin = "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-amd64.tar.gz"
    sha256 "39d43c1f3c70510075e9e9e3e159a647d25bd35461b1c5582a6d3ef88cb51a5f"
  elsif !OS.mac? && Hardware::CPU.arm?
    origin = "https://github.com/alist-org/alist/releases/download/v#{version}/alist-linux-arm64.tar.gz"
    sha256 "606a6bcff1abd25bd5aaaf9663b62bfd3281e575dda9df1852b2e48f23511cae"
  elsif !OS.mac? && !Hardware::CPU.arm?
    origin = "https://github.com/alist-org/alist/releases/download/v#{version}/alist-linux-amd64.tar.gz"
    sha256 "81f66e521fe48cb18daadab2d175116201d3ef6b5d5d7bbac1835493eb6e1c81"
  end
  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"

  livecheck do
    url "https://github.com/alist-org/alist/releases"
    strategy :github_latest
  end

  def install
    bin.install "alist"
  end
end
