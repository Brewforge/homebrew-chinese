cask "quarkclouddrive" do
  arch arm: "-arm", intel: ""
  key = on_arch_conditional arm: "ForArmUrl", intel: "DmgUrl"

  version "3.19.0,2135310-20250327222850,qqwuxzyxsqruqsysm"
  sha256 "492fe4c0e3157fe73d29cb3b6eba2d01161dda247bc697764343a32dbeadb572"

  url "https://pdds.quark.cn/download/stfile/#{version.csv.third}/QuarkCloudDrive_v#{version.csv.first}_release2_(Build#{version.csv.second}).dmg"
  name "夸克网盘"
  desc "电脑高效拍档，一键存爽快看"
  homepage "https://pan.quark.cn/"

  livecheck do
    url "https://pan.quark.cn/api/client_version"
    strategy :page_match do |page|
      data = JSON.parse(page)["data"]["origin_macDmg#{key}"]
      match = data.match(%r{.*?/stfile/(\w+)/QuarkCloudDrive_v(\d+(\.\d+)+)_release_\(Build(\d{7}-\d{14})\)}i)
      next if match.blank?

      "#{match[2]},#{match[4]},#{match[1]}"
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
