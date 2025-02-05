cask "tts-vue" do
  version "1.9.15"
  sha256 "f9121b43edc6c3661ea7fa47118e9c25ebb22fbcdda96c02b32a15cec73c7792"

  url "https://github.com/LokerL/tts-vue/releases/download/#{version}/tts-vue-macos-latest.zip"

  name "tts-vue"
  desc "微软语音合成工具"
  homepage "https://tts-doc.loker.vip/home.html"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  container nested: "#{version}/tts-vue-#{version}.dmg"

  app "tts-vue.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/tts-vue.app"]
  end

  zap trash: [
    "~/Library/Application Support/tts-vue",
    "~/Library/Application Support/tts-vue*.log",
    "~/Library/Logs/tts-vue",
    "~/Library/Preferences/vip.loker.tts-vue.plist",
    "~/Library/Saved Application State/vip.loker.tts-vue.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
