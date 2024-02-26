cask "openai-translator" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.25"
  sha256 arm:   "df655fbf9196dbb845111a60d6a3381a5d9327e4c0f9c29f203d848475f972c0",
         intel: "667b572b17c8d37fb35380441633f8c81d2c880a639143399dcd0b300ff63517"

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
