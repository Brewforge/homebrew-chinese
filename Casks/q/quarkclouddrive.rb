cask "quarkclouddrive" do
  arch arm: "-arm", intel: ""
  key = on_arch_conditional arm: "ForArmUrl", intel: "DmgUrl"

  version "3.14.0,1971792-20241104140810,ppvtutwrypqtprxrc"
  sha256 "ac26a58f2d2d8395f109487b57c58ad775dd05d0b7b0fb9be17029cbced4ee22"

  url "https://pdds.quark.cn/download/stfile/#{version.csv.third}/QuarkCloudDrive_v#{version.csv.first}_release2_(Build#{version.csv.second}).dmg"
  name "夸克网盘"
  desc "电脑高效拍档，一键存爽快看"
  homepage "https://pan.quark.cn/"

  livecheck do
    url "https://pan.quark.cn/api/client_version"
    strategy :page_match do |page|
      data = JSON.parse(page)["data"]["origin_macDmg#{key}"]
      match = data.match(%r{.*?/stfile/(\w+)/QuarkCloudDrive_v(\d+\.\d+\.\d+)_release_\(Build(\d{7}-\d{14})\)}i)
      next if match.blank?

      "#{match[2]},#{match[3]},#{match[1]}"
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
