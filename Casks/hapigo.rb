cask "hapigo" do
  version "2.11.1"
  sha256 :no_check

  url "https://dl.hapigo.com/HapiGo.dmg"
  name "HapiGo"
  desc "Essential Tools for Brainiacs"
  homepage "https://hapigo.com/"

  livecheck do
    url :url
    strategy :header_match
    regex(/最新版本 v?(\d+(?:\.\d+)+)/i)
  end

  auto_updates true
  app "HapiGo.app"

  zap trash: [
    "~/Library/Application Support/Hapigo/",
    "~/Library/Caches/Hapigo/",
    "~/Library/Preferences/com.xunyong.hapigo",
  ]
end
