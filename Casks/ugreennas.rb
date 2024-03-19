cask "ugreennas" do

  version "5.0.0"
  sha256 "668869e24789d2cc61c6667b71fa23a060fd7e7dd6dcf7dcaa7ff66f4c76653a"

  url "https://ugreen.oss-cn-shenzhen.aliyuncs.com/ugreen/mac/V#{version}/UGREEN_Nas_v#{version}.9670_843a0_release.dmg"
  name "绿联私有云"
  desc "绿联 NAS 官方客户端"
  homepage "https://www.lulian.cn"

  livecheck do
    url "https://www.ugnas.com/download"
    regex(/mac\/V(\d+(\.\d+)+)/i)
    strategy :page_match
  end

  auto_updates true

  app "绿联云.app"

  zap trash: [
    "~/Library/Logs/UGREEN_Nas",
    "~/Library/Preferences/com.ugreen.nas.client.plist",
    "~/Library/Saved Application State/com.ugreen.nas.client.savedState",
    "~/Library/Application Support/UGREEN_Nas",
  ]
end
