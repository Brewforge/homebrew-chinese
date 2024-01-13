class AlistCli < Formula
  desc "File list program that supports multiple storage, powered by Gin and Solidjs"
  homepage "https://github.com/alist-org/alist"
  url "https://github.com/alist-org/alist/archive/refs/tags/v3.30.0.tar.gz", verified: "mirror.ghproxy.com/"
  sha256 "68831d5177cdbae3ab294ce4263b4221c0ff687a72dd48a844d533ccb13c3efb"
  license "AGPL-3.0"
  head "https://github.com/alist-org/alist.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "78b6d3071b6ef8afbb8d2c3c4fdc88627f1e0e1fa61e76675fd4731596c2c965"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "78b6d3071b6ef8afbb8d2c3c4fdc88627f1e0e1fa61e76675fd4731596c2c965"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "78b6d3071b6ef8afbb8d2c3c4fdc88627f1e0e1fa61e76675fd4731596c2c965"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "78b6d3071b6ef8afbb8d2c3c4fdc88627f1e0e1fa61e76675fd4731596c2c965"
    sha256 cellar: :any_skip_relocation, sonoma:         "64d2fdcab56b35ac8bc2e84def30f883aa3c3b4603f0b921f066af41f45a0a8c"
    sha256 cellar: :any_skip_relocation, ventura:        "64d2fdcab56b35ac8bc2e84def30f883aa3c3b4603f0b921f066af41f45a0a8c"
    sha256 cellar: :any_skip_relocation, monterey:       "64d2fdcab56b35ac8bc2e84def30f883aa3c3b4603f0b921f066af41f45a0a8c"
    sha256 cellar: :any_skip_relocation, big_sur:        "64d2fdcab56b35ac8bc2e84def30f883aa3c3b4603f0b921f066af41f45a0a8c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "81f66e521fe48cb18daadab2d175116201d3ef6b5d5d7bbac1835493eb6e1c81"
  end

  def install
    bin.install "alist"
  end
end
