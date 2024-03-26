cask "alist-helper" do
  version "0.1.5"
  sha256 "107fde1e0b9315dbafd36656c09ad434a6bb45474d3d0a60e14d831f5fb7f684"

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

  zap trash: "~/Library/Preferences/dev.xmarmalade.alisthelper.alisthelper.plist"
end
