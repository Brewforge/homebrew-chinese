cask "quarkclouddrive" do
  version "3.24.0,2830624"
  sha256 "b2fb15cedb2fa35b2b9e850ffe6cb17724b6cb71d34b1422ea1aa27e93bef2ad"

  url "https://pdds.quark.cn/download/stfile/#{version.csv.third}/QuarkCloudDrive_v#{version.csv.first}_release_(Build#{version.csv.second}).dmg"
  name "夸克网盘"
  desc "电脑高效拍档，一键存爽快看"
  homepage "https://pan.quark.cn/"

  livecheck do
    url "https://pan.quark.cn/api/client_version"
    strategy :page_match do |page|
      data = JSON.parse(page)["data"]["origin_macDmgForArmUrl"]
      match = data.match(/QuarkCloudDriveMac_V(\d+(\.\d+)+)_mac_pf30003_\(zh-cn\)_release_\(Build(\d{7})\)\.dmg/i)
      next if match.blank?

      "#{match[1]},#{match[3]}"
    end
  end

  auto_updates true

  app "夸克网盘.app"

  zap trash: [
    "~/Library/Preferences/com.alibaba.quark.clouddrive",
    "~/Library/Preferences/com.alibaba.quark.clouddrive.helper.Renderer.plist",
    "~/Library/Saved Application State/com.alibaba.quark.clouddrive.savedState",
  ]
end
