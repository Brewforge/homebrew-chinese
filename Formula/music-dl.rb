class MusicDl < Formula
  desc "Music Searcher and Downloader"
  homepage "https://github.com/guanguans/music-dl"
  url "https://github.com/guanguans/music-dl/releases/download/4.1.8/music-dl.phar"
  sha256 "b5f38577d2fc154ef122a3726606ec982b46f9e076b4a1b8f5e6ab1b2e8589d1"
  license "MIT"

  depends_on "php"

  def install
    bin.install "music-dl.phar" => "music-dl"
  end
end
