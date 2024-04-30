class Makemf < Formula
  desc "让 GGUF 在 Ollama 中运行"
  homepage "https://github.com/Mrered/ShellScript"
  version "0.0.30"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/makemf_v#{version}.tar.gz"
  sha256 "1226de0d083c0f74b628b5a32280d9637a7bcc313e53ef5d85dc5bd011a3f20c"

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
