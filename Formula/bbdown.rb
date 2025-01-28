class Bbdown < Formula
  desc "Bilibili Downloader"
  homepage "https://github.com/nilaoda/BBDown"
  version "1.6.3,20240814"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nilaoda/BBDown/releases/download/1.6.3/BBDown_#{version}_osx-arm64.zip"
    sha256 "4df84014d818bd6dff2b365b847645340e8955c4450fe965688f41af89a38baa"
  elsif OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/nilaoda/BBDown/releases/download/1.6.3/BBDown_#{version}_osx-x64.zip"
    sha256 "262c15ca7890898560d00e5ffd5ada1864fbd9d0d58ac4ee492c9f3e73f3ae5f"
  elsif !OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nilaoda/BBDown/releases/download/1.6.3/BBDown_#{version}_linux-arm64.zip"
    sha256 "5bb1ab8987a33be08ad07367d2e70ea4f18868ba4538a77019aba48e76ed7892"
  elsif !OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/nilaoda/BBDown/releases/download/1.6.3/BBDown_#{version}_linux-x64.zip"
    sha256 "ec233b7d8d40b1cc4447dac05be343f53a757dc605743a8808abaa8e97e5d10e"
  end

  livecheck do
    url :homepage
    regex(/([\.|\d]+_\d{8})/i)
    strategy :github_latest do |json, regex|
      matched = json["assets"].filter_map do |asset|
        match = asset["name"].match(regex)
        next if match.blank?

        match[1]
      end.first

      next if matched.blank?

      matched.tr("_", ",")
    end
  end

  def install
    bin.install "BBDown"
  end

  test do
    system bin/"BBDown", "--version"
  end
end
