cask "openai-translator" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.9"
  sha256 arm:   "47fd7c1b28f7c686b36372ceb25ad0196470e2c0ed2fc93aebdc0ca0c465fb4e",
         intel: "e0158ea91d5a8f440f828ed2431df58a844d4227d7e97aa5e30b0b4d2bdf7058"

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
