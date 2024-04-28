class Ollamaplist < Formula
  desc "让 Ollama 监听 0.0.0.0"
  homepage "https://github.com/Mrered/ollamaplist"
  version "0.0.0"

  url "https://github.com/Mrered/ollamaplist/releases/download/#{version}/ollamaplist"
  sha256 "5b0250d34e47b972e246e98e6b46bd829bb2046afb2c99cfc79ac79cbaab62e2"

  livecheck do
    url "https://github.com/Mrered/ollamaplist/releases"
    strategy :github_latest
  end

  def install
    bin.install "ollamaplist"
  end
end
