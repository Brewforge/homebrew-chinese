cask "openai-translator" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.10"
  sha256 arm:   "f4c369ee82201d1880c45114be30bf7920a43f40cafe6d60550db2f7a2293ed3",
         intel: "8abf61ed88c0d16913e16ba7a1b8f95d0aaa3e173f90b7217f212992a5182960"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/openai-translator/openai-translator/releases/download/v#{version}/OpenAI.Translator_#{version}_#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "OpenAI Translator"
  desc "Cross-platform Translatior based on ChatGPT API"
  homepage "https://github.com/openai-translator/openai-translator/blob/main/README-CN.md"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true

  app "OpenAI Translator.app"

  zap trash: [
    "~/Library/Application Support/openai-translator",
    "~/Library/Preferences/xyz.yetone.apps.plist",
  ]
end
