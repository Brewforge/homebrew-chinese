cask "quarkclouddrive" do
  version "3.24.0,2830624,37213"
  sha256 "b2fb15cedb2fa35b2b9e850ffe6cb17724b6cb71d34b1422ea1aa27e93bef2ad"

  url "https://umcdn.quark.cn/download/37213/quarkclouddrivemac/pckk@product_guanwang/QuarkCloudDriveMac_V#{version.csv.first}_mac_pf30003_(zh-cn)_release_(Build#{version.csv.second}).dmg"
  name "夸克网盘"
  desc "电脑高效拍档，一键存爽快看"
  homepage "https://pan.quark.cn/"

  livecheck do
    url "https://pan.quark.cn/api/client_version"
    strategy :page_match do |page|
      data = JSON.parse(page)["data"]["origin_macDmgForArmUrl"]
      stem = "quarkclouddrivemac/pckk@product_guanwang/QuarkCloudDriveMac_V"
      regex(%r{/(\d{5})/#{stem}(\d+(\.\d+)+)_mac_pf30003_\(zh-cn\)_release_\(Build(\d{7})\)\.dmg}i)
      match = data.match(regex)
      next if match.blank?

      "#{match[2]},#{match[4]},#{match[1]}"
    end
  end

  auto_updates true

  app "QuarkCloudDrive.app"

  zap trash: [
    "~/Library/Preferences/com.alibaba.quark.clouddrive",
    "~/Library/Preferences/com.alibaba.quark.clouddrive.helper.Renderer.plist",
    "~/Library/Saved Application State/com.alibaba.quark.clouddrive.savedState",
  ]
end
