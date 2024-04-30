class Makemf < Formula
  desc "让 GGUF 在 Ollama 中运行"
  homepage "https://github.com/Mrered/ShellScript"
  version "0.0.29"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/makemf_v#{version}.tar.gz"
  sha256 "ba870189cb003b77ef5ee0177c34de59e8af7b291941958b69a1975763de3d7a"

  livecheck do
    url "https://github.com/Mrered/ShellScript/releases"
    strategy :github_latest
  end

  def install
    bin.install "makemf"
  end

  def post_install
    chmod 0555, bin/"makemf"
  end
end
