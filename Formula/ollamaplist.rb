class Ollamaplist < Formula
  desc "让 Ollama 监听 0.0.0.0"
  homepage "https://github.com/Mrered/ShellScript"
  version "0.0.29"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/ollamaplist_v#{version}.tar.gz"
  sha256 "d81161acf2d81c01e65eed47dbc36cdfee5ac3dddfea15d81e8bd9f7a163e203"

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
