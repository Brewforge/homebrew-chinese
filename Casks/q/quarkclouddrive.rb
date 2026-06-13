cask "quarkclouddrive" do
  version "37213,6.9.0.747,30003,3004627"
  sha256 "081ddeba3e272738d611bf23aaee87cc04622da1701c1d88501886a8fb38cfea"

  url "https://umcdn.quark.cn/download/#{version.csv.first}/quarkclouddrivemac/pckk@product_guanwang_macmini/QuarkCloudDriveMac_V#{version.csv.second}_mac_pf#{version.csv.third}_(zh-cn)_releasemini_(Build#{version.csv.fourth}).dmg"
  name "夸克网盘"
  desc "电脑高效拍档，一键存爽快看"
  homepage "https://pan.quark.cn/"

  livecheck do
    url "https://pan.quark.cn/api/client_version"
    strategy :page_match do |page|
      data = JSON.parse(page)["data"]["origin_macDmgForArmUrl"]
      stem = "quarkclouddrivemac/pckk@product_guanwang_macmini/QuarkCloudDriveMac"
      regex(%r{/(\d{5})/#{stem}_V(\d+(\.\d+)+)_mac_pf(\d{5})_\(zh-cn\)_releasemini_\(Build(\d{7})\)\.dmg}i)
      match = data.match(regex)
      next if match.blank?

      "#{match[1]},#{match[2]},#{match[4]},#{match[5]}"
    end
  end

  depends_on :macos

  app "QuarkCloudDrive.app"

  zap trash: [
    "~/Library/Preferences/com.alibaba.quark.clouddrive",
    "~/Library/Preferences/com.alibaba.quark.clouddrive.helper.Renderer.plist",
    "~/Library/Saved Application State/com.alibaba.quark.clouddrive.savedState",
  ]
end
