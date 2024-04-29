class Makemf < Formula
  desc "让 GGUF 在 Ollama 中运行"
  homepage "https://github.com/Mrered/ShellScript"
  version "0.0.18"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/makemf_v#{version}.tar.gz"
  sha256 "1c80e09bd0cee70c0072b8f19b5933be4e0c9c18abba617479e5aea71c2e66c3"

  livecheck do
    url "https://github.com/Mrered/ShellScript/releases"
    strategy :github_latest
  end

  def install
    bin.install "makemf"
  end
end
