class MusicDl < Formula
  desc "Music Searcher and Downloader"
  homepage "https://github.com/guanguans/music-dl"
  url "https://github.com/guanguans/music-dl/releases/download/5.0.1/music-dl.phar"
  sha256 "2b2d4d2e8a03a2fe26c8a145d8e00b0b57aa9fdbc0b8c0ca262a1a87f71058ed"
  license "MIT"

  depends_on "php"

  def install
    bin.install "music-dl.phar" => "music-dl"
  end
end
