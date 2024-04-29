class Makemf < Formula
  desc "让 GGUF 在 Ollama 中运行"
  homepage "https://github.com/Mrered/ShellScript"
  version "0.0.17"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/makemf_v#{version}.tar.gz"
  sha256 "2790ddd84ac306e404d854d1af0039cbc98f81eec3c477a90666230b27247deb"

  livecheck do
    url "https://github.com/Mrered/ShellScript/releases"
    strategy :github_latest
  end

  def install
    bin.install "makemf"
  end
end
