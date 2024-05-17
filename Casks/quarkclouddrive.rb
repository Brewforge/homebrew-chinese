cask "quarkclouddrive" do
  version "3.2.6,1778677-20240516190028"
  sha256 "777dff6dd87e287cc2b3749284895626cfce58f7e831cf1c6dc1a3a199e54b61"

  url "https://pdds.quark.cn/download/stfile/#{version.csv.third}/QuarkCloudDrive_v#{version.csv.first}_release_(Build#{version.csv.second}).dmg"
  name "夸克网盘"
  desc "电脑高效拍档，一键存爽快看"
  homepage "https://pan.quark.cn/"

  livecheck do
    skip "未找到可用信息"
  end

  auto_updates true

  app "夸克网盘.app"

  zap trash: ""
end
