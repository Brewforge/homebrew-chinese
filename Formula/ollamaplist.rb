class Ollamaplist < Formula
  desc "让 Ollama 监听 0.0.0.0"
  homepage "https://github.com/Mrered/ShellScript"
  version "0.0.19"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/ollamaplist_v#{version}.tar.gz"
  sha256 "07926b1ac1bafa3b730662b37d66eb34d415d631e568cc12edf3c8f8d47b6ccf"

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
