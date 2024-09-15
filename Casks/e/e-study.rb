cask "e-study" do
  version "4.3.1,285"
  sha256 :no_check

  url "https://download.cnki.net/CNKI%20E-Study%20For%20Mac.dmg",
      user_agent: :fake
  name "e-study"
  desc "Essential Tools for Brainiacs"
  homepage "https://estudy.cnki.net/"

  livecheck do
    url :url
    strategy :extract_plist
  end

  auto_updates true

  app "知网研学.app"

  zap trash: [
    "~/Library/HTTPStorages/net.cnki.EStudy",
    "~/Library/HTTPStorages/net.cnki.EStudy.binarycookies",
    "~/Library/Preferences/net.cnki.EStudy.plist",
  ]
end
