class MusicDl < Formula
  desc "Music Searcher and Downloader"
  homepage "https://github.com/guanguans/music-dl"
  url "https://github.com/guanguans/music-dl/releases/download/4.3.1/music-dl.phar"
  sha256 "67856f03326942673130aaaf368c43b003e01447834be27a1d4eb408136faef9"
  license "MIT"

  depends_on "php"

  def install
    bin.install "music-dl.phar" => "music-dl"
  end
end
