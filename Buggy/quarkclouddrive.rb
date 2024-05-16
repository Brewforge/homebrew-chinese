cask "quarkclouddrive" do
  version "3.1.2,1673534-20240205191824,ppvsstwqspqtprxrk"
  sha256 "777dff6dd87e287cc2b3749284895626cfce58f7e831cf1c6dc1a3a199e54b61"

  url "https://pdds.quark.cn/download/stfile/#{version.csv.third}/QuarkCloudDrive_v#{version.csv.first}_release_(Build#{version.csv.second}).dmg"
  name "夸克网盘"
  desc "电脑高效拍档，一键存爽快看"
  homepage "https://pan.quark.cn/"

  livecheck do
    url "https://pan.quark.cn/"
    strategy :page_match do |page|
      match = page.match(/href=.*(\w+)\/QuarkCloudDrive_v?(\d+(?:\.\d+)+)_release_\(Build(\d+-\d+)\)\.dmg/)
      next if match.blank?

      "#{match[2]},#{match[3]},#{match[1]}"
    end
  end

  auto_updates true

  app "夸克网盘.app"

  zap trash: ""
end
