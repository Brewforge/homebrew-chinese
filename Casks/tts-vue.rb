cask "tts-vue" do
  version "1.9.15"
  sha256 "f9121b43edc6c3661ea7fa47118e9c25ebb22fbcdda96c02b32a15cec73c7792"

  url "https://github.com/LokerL/tts-vue/releases/download/#{version}/tts-vue-macos-latest.zip",
      verified: "github.com/LokerL/"
  name "tts-vue"
  desc "微软语音合成工具"
  homepage "https://tts-doc.loker.vip/home.html"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "tts-vue.app"

  zap trash: [
    "~/Library/Logs/tts-vue",
    "~/Library/Preferences/vip.loker.tts-vue.plist",
    "~/Library/Saved Application State/vip.loker.tts-vue.savedState",
    "~/Library/Application Support/tts-vue",
    "~/Library/Application Support/tts-vue\logs\2023-12-2.log",
  ]
end
