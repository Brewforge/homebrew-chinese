cask "quarkclouddrive" do
  version "6.5.1.711,2899163"
  sha256 "e94e580118a70973254038458263bc227941ab42049cae6d3ee59e75b0ea821c"

  url "https://umcdn.quark.cn/download/37213/quarkclouddrivemac/pckk@product_guanwang/QuarkCloudDriveMac_V#{version.csv.first}_mac_pf30003_(zh-cn)_release_(Build#{version.csv.second}).dmg"
  name "夸克网盘"
  desc "电脑高效拍档，一键存爽快看"
  homepage "https://pan.quark.cn/"

  livecheck do
    skip "API is outdated"
  end

  auto_updates true

  app "夸克网盘.app"

  zap trash: [
    "~/Library/Preferences/com.alibaba.quark.clouddrive",
    "~/Library/Preferences/com.alibaba.quark.clouddrive.helper.Renderer.plist",
    "~/Library/Saved Application State/com.alibaba.quark.clouddrive.savedState",
  ]
end
