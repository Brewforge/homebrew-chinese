class Ollamaplist < Formula
  desc "让 Ollama 监听 0.0.0.0"
  homepage "https://github.com/Mrered/ShellScript"
  version "0.0.28"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/ollamaplist_v#{version}.tar.gz"
  sha256 "a7212ca4fa68091d15f8d0b516a8da00d0e2dd2a78983fa173f9246d32b665f0"

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
