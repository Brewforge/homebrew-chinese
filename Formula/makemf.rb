class Makemf < Formula
  desc "让 GGUF 在 Ollama 中运行"
  homepage "https://github.com/Mrered/ShellScript"
  version "0.0.19"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/makemf_v#{version}.tar.gz"
  sha256 "e631dc39ed9e7483d25a5143f18cdfbf18ac028e1dee477df5e5fbb2a7949d7c"

  livecheck do
    url "https://github.com/Mrered/ShellScript/releases"
    strategy :github_latest
  end

  def install
    bin.install "makemf"
  end
end
