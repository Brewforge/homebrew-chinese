class Shurl < Formula
  desc "Self-built short chain shortcut based on YOURLS"
  homepage "https://github.com/Mrered/yourlsh"
  url "https://mirror.ghproxy.com/https://github.com/Mrered/yourlsh/releases/download/v#{version}/shurl.tar.gz",
      verified: "mirror.ghproxy.com/"
  version "2.0.0"
  sha256 "ae374314f6e87415a008cb035237ba8fef3207bd240de70e783e9619a829227f"
  license "MIT"
  version_scheme 1

  livecheck do
    url :homepage
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "shurl"
  end
end
