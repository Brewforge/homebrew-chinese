cask "quarkclouddrive" do
  version "6.5.1.711,2899163,37213"
  sha256 "e94e580118a70973254038458263bc227941ab42049cae6d3ee59e75b0ea821c"

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
