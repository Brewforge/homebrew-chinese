class Bbdown < Formula
  desc "Bilibili Downloader"
  homepage "https://github.com/nilaoda/BBDown"
  license "MIT"

  mirror = "https://mirror.ghproxy.com/"
  if OS.mac? && Hardware::CPU.arm?
    url "#{mirror}https://github.com/nilaoda/BBDown/releases/download/1.6.2/BBDown_1.6.2_20240512_osx-arm64.zip",
      verified: "mirror.ghproxy.com/"
    sha256 "65e81ecdf574c2ee8d2d7c36afcc17a67c53e0172acc6f8f642d89da698ed44d"
  elsif OS.mac? && !Hardware::CPU.arm?
    url "#{mirror}https://github.com/nilaoda/BBDown/releases/download/1.6.2/BBDown_1.6.2_20240512_osx-x64.zip",
      verified: "mirror.ghproxy.com/"
    sha256 "69e8f1affbbd479847a0d169e23ed4be8051d1627e0067dd9fc1711f72401a6a"
  elsif !OS.mac? && Hardware::CPU.arm?
    url "#{mirror}https://github.com/nilaoda/BBDown/releases/download/1.6.2/BBDown_1.6.2_20240512_linux-arm64.zip",
      verified: "mirror.ghproxy.com/"
    sha256 "5bb1ab8987a33be08ad07367d2e70ea4f18868ba4538a77019aba48e76ed7892"
  elsif !OS.mac? && !Hardware::CPU.arm?
    url "#{mirror}https://github.com/nilaoda/BBDown/releases/download/1.6.2/BBDown_1.6.2_20240512_linux-x64.zip",
      verified: "mirror.ghproxy.com/"
    sha256 "69e8f1affbbd479847a0d169e23ed4be8051d1627e0067dd9fc1711f72401a6a"
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
end
