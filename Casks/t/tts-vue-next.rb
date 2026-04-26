cask "tts-vue-next" do
  version "0.1.0"
  sha256 "e730a0521b552cfe34aac31ca20f9c55e1d022332650357e2da5d6899c07c83a"

  url "https://github.com/LokerL/tts-vue-next/releases/download/v#{version}/tts-vue-next_#{version}_aarch64.dmg",
      verified: "github.com/LokerL/tts-vue-next/"
  name "tts-vue-next"
  desc "微软语音合成工具"
  homepage "https://tts-doc.loker.vip/home.html"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64

  app "tts-vue-next.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/tts-vue-next.app"]
  end

  zap trash: [
    "~/Library/Caches/com.lenovo.tts-vue-next",
    "~/Library/WebKit/com.lenovo.tts-vue-next",
  ]
end
