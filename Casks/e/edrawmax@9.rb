cask "edrawmax@9" do
  version "9.2"
  sha256 :no_check

  language "CN", default: true do
    url "https://edrawsoft.cn/2download/edrawmax-cn-9.2.dmg"
    homepage "https://edrawsoft.cn/"
  end
  language "en" do
    url "https://edrawsoft.com/archives/edrawmax-9.2.dmg"
    homepage "https://edrawsoft.com/"
  end

  name "EdrawMax"
  desc "Diagram software"

  livecheck do
    skip "历史版本，不更新"
  end

  auto_updates true
  conflicts_with cask: "edrawmax"

  app "EdrawMax.app"

  zap trash: [
    "~/Library/Edraw",
    "~/Library/Preferences/com.edrawsoft.edrawmax.plist",
    "~/Library/Saved Application State/com.edrawsoft.edrawmax.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
