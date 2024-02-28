cask "e-study" do
  version "4.2.1"
  sha256 :no_check

  url "https://download.cnki.net/CNKI%20E-Study%20For%20Mac.dmg"
  name "e-study"
  desc "Essential Tools for Brainiacs"
  homepage "https://estudy.cnki.net/"

  livecheck do
    # url :homepage
    # regex(/Mac(\d+(\.\d+)+)/i)
    # strategy :page_match
    skip "SPA 暂时无解，无法自动更新。具体信息看 https://github.com/Brewforge/homebrew-chinese/pull/32"
  end

  auto_updates true

  app "知网研学（原E-Study）.app"

  zap trash: [
    "~/Library/HTTPStorages/net.cnki.EStudy",
    "~/Library/HTTPStorages/net.cnki.EStudy.binarycookies",
    "~/Library/Preferences/net.cnki.EStudy.plist",
  ]
end
