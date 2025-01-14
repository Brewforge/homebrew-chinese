class Ollamaplist < Formula
  desc "给 Ollama CLI 添加环境变量"
  homepage "https://github.com/Mrered/Gobin"
  url "https://mirror.ghproxy.com/https://github.com/Mrered/Gobin/releases/download/v#{version}/ollamaplist_#{version}_darwin_arm64.tar.gz",
    verified: "mirror.ghproxy.com/"
  version "0.2.2"
  sha256 "9ffa61dfdc430d21c7e675205a3a73768f9a063065e8b8f9a55b3b3b71d24ebf"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_intel do
      url "https://mirror.ghproxy.com/https://github.com/Mrered/Gobin/releases/download/v#{version}/ollamaplist_#{version}_darwin_amd64.tar.gz",
        verified: "mirror.ghproxy.com/"
      sha256 "d311991876899604b5000730e21f0c17c38d34fef4a5d2e6f00ade044250d008"
    end
  end

  def install
    bin.install "ollamaplist"
  end

  def post_install
    chmod 0555, bin/"ollamaplist"
  end
end
