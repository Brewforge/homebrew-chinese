class Ollamaplist < Formula
  desc "让 Ollama 监听 0.0.0.0"
  homepage "https://github.com/Mrered/ShellScript"
  version "0.0.17"

  url "https://github.com/Mrered/ShellScript/releases/download/v#{version}/ollamaplist_#{version}.tar.gz"
  sha256 "1349c7efec9c3918fe3fe7171fd69e1f7a79b0f5948769cf254c765d9a7abadc"

  livecheck do
    url "https://github.com/Mrered/ShellScript/releases"
    strategy :github_latest
  end

  def install
    bin.install "ollamaplist"
  end
end
