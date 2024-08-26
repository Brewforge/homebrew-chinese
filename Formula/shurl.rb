class Shurl < Formula
  desc "Self-built short chain shortcut based on YOURLS"
  homepage "https://github.com/Mrered/yourlsh"
  license "MIT"
  version_scheme 1

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/Mrered/yourlsh/releases/download/v2.0.0/shurl.tar.gz"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  sha256 "ae374314f6e87415a008cb035237ba8fef3207bd240de70e783e9619a829227f"

  livecheck do
    url :homepage
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "shurl"
  end
end
