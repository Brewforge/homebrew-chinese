class Ollamaplist < Formula
  desc "让 Ollama 监听 0.0.0.0"
  homepage "https://github.com/Mrered/ShellScript"
  version "0.0.18"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/ollamaplist_v#{version}.tar.gz"
  sha256 "a12b0d11745fc900b0a208b069c7b91a7cdd42f559a1717b9b71f74fb6d173c5"

  livecheck do
    url "https://github.com/Mrered/ShellScript/releases"
    strategy :github_latest
  end

  def install
    bin.install "ollamaplist"
  end
end
