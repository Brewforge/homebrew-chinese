class Makemf < Formula
  desc "让 GGUF 在 Ollama 中运行"
  homepage "https://github.com/Mrered/ShellScript"
  version "13"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/makemf.tar.gz"
  sha256 "381f3bef6c9ada46059edff0ed4946ebfdfaf0240626517b196f722be8026748"

  livecheck do
    url "https://github.com/Mrered/ShellScript/releases"
    strategy :github_latest
  end

  def install
    bin.install "makemf"
  end
end
