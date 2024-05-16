class Bbdown < Formula
  desc "Bilibili Downloader"
  homepage "https://github.com/nilaoda/BBDown"
  version "1.6.2_20240512"
  license "MIT"

  arch = Hardware::CPU.arm? ? "arm64" : "x64"

  if OS.mac?
    url "https://github.com/nilaoda/BBDown/releases/download/#{version.to_s.split("_")[0]}/BBDown_#{version}_osx-#{arch}.zip"
    if Hardware::CPU.arm?
      sha256 "65e81ecdf574c2ee8d2d7c36afcc17a67c53e0172acc6f8f642d89da698ed44d"
    else
      sha256 "69e8f1affbbd479847a0d169e23ed4be8051d1627e0067dd9fc1711f72401a6a"
    end
  else
    url "https://github.com/nilaoda/BBDown/releases/download/#{version.to_s.split("_")[0]}/BBDown_#{version}_linux-#{arch}.zip"

    if Hardware::CPU.arm?
      sha256 "5bb1ab8987a33be08ad07367d2e70ea4f18868ba4538a77019aba48e76ed7892"
    else
      sha256 "69e8f1affbbd479847a0d169e23ed4be8051d1627e0067dd9fc1711f72401a6a"
    end
  end

  livecheck do
    url "https://github.com/nilaoda/BBDown/releases"
    regex(/([\.|\d]+_\d{8})/i)
    strategy :github_latest do |json, regex|
      matches = json["assets"].map { |release| release["browser_download_url"].match(regex) }.compact
      next if matches.blank?
      matches.map { |match| match[1] }.max_by { |version| Version.new(version) }
    end
  end

  def install
    bin.install "BBDown"
  end
end
