class Alist < Formula
  desc "File list program that supports multiple storage, powered by Gin and Solidjs"
  homepage "https://alist.nn.ci/"
  version "3.42.0"
  license "AGPL-3.0-only"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AlistGo/alist/releases/download/v3.42.0/alist-darwin-arm64.tar.gz"
    sha256 "d2a33d52e95d5b79e02736fe5adba75c8af784848a403508312c16992f983192"
  elsif OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/AlistGo/alist/releases/download/v3.42.0/alist-darwin-amd64.tar.gz"
    sha256 "1d24f20c07a3e03d0b5643313f3f101eada35147d78bb39e06a9d5808a03ee51"
  elsif !OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AlistGo/alist/releases/download/v3.42.0/alist-linux-arm64.tar.gz"
    sha256 "229fd1604f4a692065a9dd31fc2ddc50e7ec2050392081153807a4f0d411e4cf"
  elsif !OS.mac? && !Hardware::CPU.arm?
    url "https://github.com/AlistGo/alist/releases/download/v3.42.0/alist-linux-amd64.tar.gz"
    sha256 "ae7a73dda8c9c2aff0089b07c240a8c9b98f8dffdd6aa448a51bf3bdf1f8ded0"
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
