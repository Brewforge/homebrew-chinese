class AlistCli < Formula
  desc "File list program that supports multiple storage, powered by Gin and Solidjs"
  homepage "https://github.com/alist-org/alist"
  version "3.33.0"
  license "AGPL-3.0"

  mirror = "https://mirror.ghproxy.com/"
  if OS.mac? && Hardware::CPU.arm?
    url "#{mirror}https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-arm64.tar.gz",
      verified: "mirror.ghproxy.com/"
    sha256 "59b7b3737fdd066858a4cd6cfd527516e1feac3b9074f4ecb7b5ff759baf4155"
  elsif OS.mac? && !Hardware::CPU.arm?
    url "#{mirror}https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-amd64.tar.gz",
      verified: "mirror.ghproxy.com/"
    sha256 "39d43c1f3c70510075e9e9e3e159a647d25bd35461b1c5582a6d3ef88cb51a5f"
  elsif !OS.mac? && Hardware::CPU.arm?
    url "#{mirror}https://github.com/alist-org/alist/releases/download/v#{version}/alist-linux-arm64.tar.gz",
      verified: "mirror.ghproxy.com/"
    sha256 "1cb865edb99452dfd0fad35c4c4dbee45f9756259c2efda837fa5fdf7d7782f0"
  elsif !OS.mac? && !Hardware::CPU.arm?
    url "#{mirror}https://github.com/alist-org/alist/releases/download/v#{version}/alist-linux-amd64.tar.gz",
      verified: "mirror.ghproxy.com/"
    sha256 "24c034739f241783d844c1b14f4655e1b88d1cca5009c0df7f9de5c366522b4a"
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end

  def install
    bin.install "alist"
  end
end
