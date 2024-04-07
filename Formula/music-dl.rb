class MusicDl < Formula
  desc "Music Searcher and Downloader"
  homepage "https://github.com/guanguans/music-dl"
  url "https://github.com/guanguans/music-dl/releases/download/4.2.1/music-dl.phar"
  sha256 "9b92f9fd6cf52bb9078aa16b5bd04ed572ef2f376d3b321070299818e9cc2ed1"
  license "MIT"

  depends_on "php"

  def install
    bin.install "music-dl.phar" => "music-dl"
  end
end
