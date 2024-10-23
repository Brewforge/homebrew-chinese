class Alist < Formula
  desc "File list program that supports multiple storage, powered by Gin and Solidjs"
  homepage "https://alist.nn.ci/"
  version "3.38.0"
  license "AGPL-3.0-only"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AlistGo/alist/releases/download/v#{version}/alist-darwin-arm64.tar.gz"
    sha256 "2d6678a48344cdc809451ab4795ada27fe60f805e8d5249b84cbf46dadd13163"
  elsif OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/AlistGo/alist/releases/download/v#{version}/alist-darwin-amd64.tar.gz"
    sha256 "39d43c1f3c70510075e9e9e3e159a647d25bd35461b1c5582a6d3ef88cb51a5f"
  elsif !OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AlistGo/alist/releases/download/v#{version}/alist-linux-arm64.tar.gz"
    sha256 "1cb865edb99452dfd0fad35c4c4dbee45f9756259c2efda837fa5fdf7d7782f0"
  elsif !OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/AlistGo/alist/releases/download/v#{version}/alist-linux-amd64.tar.gz"
    sha256 "24c034739f241783d844c1b14f4655e1b88d1cca5009c0df7f9de5c366522b4a"
  end

  livecheck do
    url "https://github.com/AlistGo/alist"
    strategy :github_latest
  end

  def install
    bin.install "alist"
  end

  def post_install
    (var/"log/alist").mkpath
    (etc/"alist").mkpath
    prefix.install_symlink etc/"alist" => opt_prefix/"data"
    ln_s var/"log/alist", opt_prefix/"data/log"
  end

  service do
    run [opt_bin/"alist", "server"]
    working_dir opt_prefix
    keep_alive true
  end

  def caveats
    <<~EOS
      To reveal alist admin user's info in default `config.json` again, run the following command:
        cd #{opt_prefix} && alist admin
      Or reveal `admin` password via `sqlite3` command (before v3.25.1):
        sqlite3 #{etc}/alist/data.db "select password from x_users where username = 'admin'"
      Or reset `admin` password:
        cd #{opt_prefix} && alist admin random
      Or set new `admin` password:
        cd #{opt_prefix} && alist admin set NEW_PASSWORD
    EOS
  end

  test do
    system bin/"alist", "admin"
  end
end
