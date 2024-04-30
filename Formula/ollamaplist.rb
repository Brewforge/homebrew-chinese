class Ollamaplist < Formula
  desc "让 Ollama 监听 0.0.0.0"
  homepage "https://github.com/Mrered/ShellScript"
  version "0.0.30"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/ollamaplist_v#{version}.tar.gz"
  sha256 "85747c5b6a8d13f3c90a569661c85e2e7457d337fb1e7b223be0d50f7d4e9565"

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
