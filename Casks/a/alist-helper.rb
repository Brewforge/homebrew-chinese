cask "alist-helper" do
  arch arm: ".dmg", intel: "x86_64.tar.gz"

  version "0.2.0"
  sha256 arm:   "e202fcfbb5d46d6ceb3e36c24c4e37f3235663cd3d880fe35ba2c30da243b958",
         intel: "969f14af3c422b33f9e818689e34401cdd4f0f9eb9f4c72f3a444f0e7ee33825"

  url "https://github.com/Xmarmalade/alisthelper/releases/download/v#{version}/AlistHelper_app_v#{version}_macos#{arch}"
  name "Alist Helper"
  desc "Application to simplify the use of the desktop version of alist"
  homepage "https://github.com/Xmarmalade/alisthelper"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "alisthelper.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/dev.xmarmalade.alisthelper.alisthelper",
    "~/Library/Preferences/dev.xmarmalade.alisthelper.alisthelper.plist",
    "~/Library/Saved Application State/dev.xmarmalade.alisthelper.alisthelper.savedState",
  ]
end
