cask "alist" do
  arch arm: "arm64", intel: "amd64"

  os macos: "darwin", linux: "linux"

  version "3.43.0"
  sha256 arm:          "ceda5c0a737dd463f9516a83261b06a5d3116e056dc7c889c158bf094a7be1fd",
         x86_64:       "1c860d0727017fc3e4256fd12641872147aca18647e8a205f6322a44a5e8407c",
         arm64_linux:  "229fd1604f4a692065a9dd31fc2ddc50e7ec2050392081153807a4f0d411e4cf",
         x86_64_linux: "ae7a73dda8c9c2aff0089b07c240a8c9b98f8dffdd6aa448a51bf3bdf1f8ded0"

  url "https://github.com/AlistGo/alist/releases/download/v#{version}/alist-#{os}-#{arch}.tar.gz",
      verified: "github.com/AlistGo/alist/"
  name "alist"
  desc "File list program that supports multiple storage, powered by Gin and Solidjs"
  homepage "https://alist.nn.ci/"

  livecheck do
    url "https://github.com/AlistGo/alist"
    strategy :github_latest
  end

  binary "alist"
  service do
    run [opt_bin/"alist", "server"]
    working_dir bin
    keep_alive true
  end

  def caveats
    <<~EOS
      To reveal alist admin user's info in default `config.json` again, run the following command:
        cd #{staged_path} && alist admin
      Or reveal `admin` password via `sqlite3` command (before v3.25.1):
        sqlite3 etc/alist/data.db "select password from x_users where username = 'admin'"
      Or reset `admin` password:
        cd #{staged_path} && alist admin random
      Or set new `admin` password:
        cd #{staged_path} && alist admin set NEW_PASSWORD
    EOS
  end
end
