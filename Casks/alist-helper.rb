cask "alist-helper" do
  version "0.1.4"
  sha256 "965e30115863552db3b0a073ba9815089466a944b712eb60c850af5d871c3508"

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

  app  "alisthelper.app"

  zap trash: [
    "~/Library/Preferences/dev.xmarmalade.alisthelper.alisthelper.plist",
  ]
end
