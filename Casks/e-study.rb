cask "e-study" do
  version "4.1.1"
  sha256 :no_check

  url "https://download.cnki.net/CNKI%20E-Study%20For%20Mac.dmg"
  name "e-study"
  desc "Essential Tools for Brainiacs"
  homepage "https://estudy.cnki.net/"

  livecheck do
    url :homepage
    regex(/Mac(\d+(\.\d+)+)/i)
  end

  auto_updates true

  app "知网研学（原E-Study）.app"

  zap trash: [
    "~/Library/Preferences/net.cnki.EStudy.plist",
    "~/Library/HTTPStorages/net.cnki.EStudy.binarycookies",
    "~/Library/HTTPStorages/net.cnki.EStudy",
  ]
end
