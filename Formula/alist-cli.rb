class AlistCli < Formula
  desc "A file list program that supports multiple storage, powered by Gin and Solidjs."
  homepage "https://github.com/alist-org/alist"
  license "GNU GPLv3"
  version "3.29.1"

  arch = Hardware::CPU.arm? ? "arm64" : "amd64"
  os_family = OS.mac? ? "darwin" : "linux"

  url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-#{os_family}-#{arch}.tar.gz"

  if OS.mac?
    sha256 Hardware::CPU.arm? ?
            "78b6d3071b6ef8afbb8d2c3c4fdc88627f1e0e1fa61e76675fd4731596c2c965" :
            "64d2fdcab56b35ac8bc2e84def30f883aa3c3b4603f0b921f066af41f45a0a8c"
  else
    sha256 Hardware::CPU.arm? ?
            "606a6bcff1abd25bd5aaaf9663b62bfd3281e575dda9df1852b2e48f23511cae" :
            "81f66e521fe48cb18daadab2d175116201d3ef6b5d5d7bbac1835493eb6e1c81"
  end

  livecheck do
    url :homepage
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "alist"
  end
end
