cask "edrawmax-9" do
  version "9.2"
  sha256 :no_check

  language "CN", default: true do
    url "https://www.edrawsoft.cn/2download/edrawmax-cn-9.2.dmg"
    homepage "http://www.edrawsoft.cn/"
  end
  language "en" do
    url "https://www.edrawsoft.com/archives/edrawmax-9.2.dmg"
    homepage "https://www.edrawsoft.com/"
  end

  name "EdrawMax"
  desc "Diagram software"

  auto_updates true
  app "EdrawMax.app"

  zap trash: [
    "~/Library/Edraw",
    "~/Library/Preferences/com.edrawsoft.edrawmax.plist",
    "~/Library/Saved Application State/com.edrawsoft.edrawmax.savedState",
  ]
end
