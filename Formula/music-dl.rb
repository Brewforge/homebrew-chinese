class MusicDl < Formula
  desc "Music Searcher and Downloader"
  homepage "https://github.com/guanguans/music-dl"
  license "MIT"
  version "4.1.7"

  url "https://github.com/guanguans/music-dl/releases/download/4.1.6/music-dl.phar"
  sha256 "50155de55d2382b2b8214d0601f1d532c7f529b955d8d72abdf92d49a15b1e24"

  depends_on "php"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "music-dl.phar" => "music-dl"
  end
end
