cask "alist-helper" do
  version "0.2.0"
  sha256 "969f14af3c422b33f9e818689e34401cdd4f0f9eb9f4c72f3a444f0e7ee33825"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/Xmarmalade/alisthelper/releases/download/v#{version}/AlistHelper_app_v#{version}_macos-x86_64.tar.gz"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "Alist Helper"
  desc "Application to simplify the use of the desktop version of alist"
  homepage "https://github.com/Xmarmalade/alisthelper"

  livecheck do
    url origin.to_s
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
