class MusicDl < Formula
  desc "Music Searcher and Downloader"
  homepage "https://github.com/guanguans/music-dl"
  url "https://github.com/guanguans/music-dl/releases/download/4.3.0/music-dl.phar"
  sha256 "b2faa6336d9855c04d20a023d65008260b6e058ac3482c9fa12c5dc3dd062701"
  license "MIT"

  depends_on "php"

  def install
    bin.install "music-dl.phar" => "music-dl"
  end
end
