class Makemf < Formula
  desc "让 GGUF 在 Ollama 中运行"
  homepage "https://github.com/Mrered/ShellScript"
  version "13"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/makemf.tar.gz"
  sha256 "56988f3e31578fed52306353fc4bbd8b225fcefdcd5487570856effa2f356e1d"

  livecheck do
    url "https://github.com/Mrered/ShellScript/releases"
    strategy :github_latest
  end

  def install
    bin.install "makemf"
  end
end
