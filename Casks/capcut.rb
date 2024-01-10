cask "capcut" do
  version "3.2.0.1106"
  sha256 "c5ebdc675d3c5b718e4fec910a3ff375dcd10c341d1235f9832806740b2c158e"

  url "https://lf16-capcut.faceulv.com/obj/capcutpc-packages-us/packages/CapCut_#{version.dots_to_underscores}_capcutpc_0_creatortool.dmg",
      verified: "lf16-capcut.faceulv.com/obj/capcutpc-packages-us/packages/"
  name "CapCut"
  desc "Creative platform powered by AI that enables video editing and image design"
  homepage "https://www.capcut.com/"

  livecheck do
    url "https://editor-api-sg.capcut.com/service/settings/v3/?app=1&arch_info=arm64&device_id=2398670469&aid=359289&from_aid=359289&device_platform=mac&from_channel=capcutpc_0"
    regex(/CapCut[._-]v?(\d+(?:[._]\d+)+).+?\.dmg/i)
    strategy :json do |json, regex|
      url = json.dig("data", "settings", "installer_downloader_config", "url")
      next if url.blank?

      match = url.match(regex)
      next if match.blank?

      match[1].tr("_", ".")
    end
  end

  depends_on macos: ">= :mojave"

  app "CapCut.app"

  zap trash: [
    "~/Library/Application Scripts/com.lemon.lvoverseas",
    "~/Library/Containers/com.lemon.lvoverseas",
    "~/Library/Group Containers/22MMUN2RN5.lv",
    "~/Library/Group Containers/22MMUN2RN5.ve",
  ]
end
