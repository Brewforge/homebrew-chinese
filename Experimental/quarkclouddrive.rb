cask "quarkclouddrive" do
  version "3.0.8,1636566-20240105144559"
  sha256 "777dff6dd87e287cc2b3749284895626cfce58f7e831cf1c6dc1a3a199e54b61"

  url "https://pdds.quark.cn/download/stfile/oourpswvsopsoqwqc/QuarkCloudDrive_v#{version.csv.first}_release2_(Build#{version.csv.second}).dmg"
  name "LinkEase"
  desc "夸克网盘"
  homepage "https://pan.quark.cn/"

  livecheck do
    url "https://pan.quark.cn/"
    regex(%r{iframe src=["'].+v?(\d+(?:\.\d+)+)_release\d_\(Build(\d+)\)\.dmg.+['"]>}i)
  end

  auto_updates true

  app "夸克网盘.app"

  zap trash: [
  ]
end
