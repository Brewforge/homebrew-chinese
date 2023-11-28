class Alist < Formula
  desc "A file list program that supports multiple storage, powered by Gin and Solidjs."
  homepage "https://github.com/alist-org/alist"
  version "3.28.0"
  license "GNU GPLv3"

  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  if OS.mac?
    url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-#{arch}.tar.gz"
    if Hardware::CPU.arm?
      sha256 "8e4ec21ea43292659f0ab8e8c1f9e1fdb64c993dd29eb6a63ccc112e44bb3931"
    else
      sha256 "b8e59da89377165cee885375bb92a3d7e01a83d5d119229a56f47eda331eeb35"
    end
  else
    url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-linux-#{arch}.tar.gz"
    if Hardware::CPU.arm?
      sha256 "6e3611a31de104ffca9575c1f30225e38c351eb8f502ec280a388afdeead4517"
    else
      sha256 "894e1b58da5a8e54fc27e277f3d4c25aa00df0e1e748e50619ce7d89b176bbec"
    end
  end

  livecheck do
    url :homepage
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "alist"
  end
end
