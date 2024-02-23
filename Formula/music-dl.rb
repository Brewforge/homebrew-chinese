class MusicDl < Formula
  desc "Music Searcher and Downloader"
  homepage "https://github.com/guanguans/music-dl"
  license "MIT"
  version "4.1.7"

  url "https://github.com/guanguans/music-dl/releases/download/4.1.7/music-dl.phar"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  depends_on "php"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "music-dl.phar" => "music-dl"
  end
end
