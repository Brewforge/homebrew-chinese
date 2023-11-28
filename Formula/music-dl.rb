class MusicDl < Formula
  desc "Music Searcher and Downloader"
  homepage "https://github.com/guanguans/music-dl"
  license "MIT"
  version "3.6.1"
  version_scheme 1

  url "https://raw.githubusercontent.com/guanguans/music-dl/master/builds/music-dl"
  sha256 "e7088812b3b26497c2069aee539054d684923e7d7d67503066009de010830ba1"

  livecheck do
    url :homepage
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "music-dl"
  end
end
