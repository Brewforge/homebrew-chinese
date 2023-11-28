class Bbdown < Formula
  desc "Bilibili Downloader"
  homepage "https://github.com/nilaoda/BBDown"
  version "1.6.1.20230818"
  license "MIT"

  arch = Hardware::CPU.arm? ? "arm64" : "x64"

  if OS.mac?
    url "https://github.com/nilaoda/BBDown/releases/download/#{version.major_minor_patch}/BBDown_#{version.major_minor_patch}_#{version.to_s.match(/\d{8}/)}_osx-#{arch}.zip"
    if Hardware::CPU.arm?
      sha256 "d0c9a7603833a466eb153a17279748c43a9ca77d10a84df68c0d66bba1ed6d8b"
    else
      sha256 "69e8f1affbbd479847a0d169e23ed4be8051d1627e0067dd9fc1711f72401a6a"
    end
  else
    url "https://github.com/nilaoda/BBDown/releases/download/#{version.major_minor_patch}/BBDown_#{version.major_minor_patch}_#{version.to_s.match(/\d{8}/)}_linux-#{arch}.zip"

    if Hardware::CPU.arm?
      sha256 "5bb1ab8987a33be08ad07367d2e70ea4f18868ba4538a77019aba48e76ed7892"
    else
      sha256 "69e8f1affbbd479847a0d169e23ed4be8051d1627e0067dd9fc1711f72401a6a"
    end
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    bin.install "BBDown"
  end
end
