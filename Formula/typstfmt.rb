class Typstfmt < Formula
  desc "Basic formatter for the Typst language with a future"
  homepage "https://github.com/astrale-sharp/typstfmt"
  version "0.2.7"
  license "MIT"

  arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"

  if OS.mac?

    url "https://github.com/astrale-sharp/typstfmt/releases/download/#{version}/typstfmt-#{arch}-apple-darwin.tar.xz"
    if Hardware::CPU.arm?
      sha256 "de93e846436198ffdb027605e5229e11d3bb164ea22f595f8894f7ae12446c82"
    else
      sha256 "69e8f1affbbd479847a0d169e23ed4be8051d1627e0067dd9fc1711f72401a6a"
    end
  end

  livecheck do
    url :homepage
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "typstfmt"
  end
end
