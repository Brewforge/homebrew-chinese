cask "openai-translator" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.4"
  sha256 arm:   "cca08d5fccb6b0da7612b51733bb2709aafad03fff359d52f0d64ec3e2b864fa",
         intel: "6dfbcff19b5e229a1302a7f74f20e5da7562ac7242d7530d2edacd20487af619"

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
