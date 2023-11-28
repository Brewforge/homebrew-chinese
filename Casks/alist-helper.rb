cask "alist-helper" do
  version "0.1.3"
  sha256 "5c77ef780fa9254ec79527be8b8b7d0da793001c0de05e6d707fdf2b2e930012"

  url "https://github.com/Xmarmalade/alisthelper/releases/download/v#{version}/AlistHelper_v#{version}_macos.dmg"
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
    "~/Library/Preferences/dev.xmarmalade.alisthelper.alisthelper.plist",
  ]
end
