cask "autotyper" do
  version "041006"
  sha256 "6651287fa312324a36055218e9fa55f6fb11b70ebb8ccf7b7da3d41dce8e7afd"

  url "https://autoglm.aminer.cn/desktop_client/AutoTyper_#{version}.dmg",
      verified: "autoglm.aminer.cn/"
  name "AutoTyper"
  desc "一款智能的AI语音输入工具"
  homepage "https://autoglm.zhipuai.cn/"

  livecheck do
    url "https://autoglm.zhipuai.cn/autotyper/"
    regex(/(\d{6})\.dmg/i)
  end

  app "AutoGLM.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/AutoGLM.app"]
  end

  zap trash: [
    "/Applications/AutoGLM.app",
    "~/Library/Caches/com.zhipu.agent",
    "~/Library/Preferences/com.zhipu.agent.plist",
  ]
end
