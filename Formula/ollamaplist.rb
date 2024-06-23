class Ollamaplist < Formula
  desc "给 Ollama CLI 添加环境变量"
  homepage "https://github.com/Mrered/Gobin"
  version "0.1.0"

  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  if OS.mac?
    url "https://github.com/Mrered/Gobin/releases/download/v#{version}/Gobin_#{version}_darwin_#{arch}.tar.gz"
    if Hardware::CPU.arm?
      sha256 "8b1f4a6a7e140b8c5284d85fd4ff6a58b0b7a9ad18dbb4cbb27c5b5386bc85b9"
    else
      sha256 "9ea2e0fb021143c8354dbe8e2ca63b960d45b2d270e24ca876d8c0ce86ac3162"
    end
  else
    url "https://github.com/Mrered/Gobin/releases/download/v#{version}/Gobin_#{version}_linux_#{arch}.tar.gz"
    if Hardware::CPU.arm?
      sha256 "c1b53a1c4402a92ce847cb8056fca8f8f577383fbec155474ef1ddf26f15914f"
    else
      sha256 "2d3f5b48fa913e2b3aa2f2be44eede5dc8a213735ff361ab5b23176428730508"
    end
  end

  livecheck do
    url "https://github.com/Mrered/ShellScript/releases"
    strategy :github_latest
  end

  def install
    bin.install "ollamaplist"
  end

  def post_install
    chmod 0555, bin/"ollamaplist"
  end
end
