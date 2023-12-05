cask "openai-translator" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.5"
  sha256 arm:   "05e60021a35a5fa83dd2d3e683f4580dbadc0338336bd0fb1b14bce39d46256d",
         intel: "f8bb2149f13a0c6f8bdcb1a391cc0c584a02506db6b44498004fbaccde3a1c84"

  url "https://github.com/yetone/openai-translator/releases/download/v#{version}/OpenAI.Translator_#{version}_#{arch}.dmg"
  name "OpenAI Translator"
  desc "Cross-platform Translatior based on ChatGPT API"
  homepage "https://github.com/yetone/openai-translator"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "OpenAI Translator.app"

  zap trash: [
    "~/Library/Application Support/openai-translator",
    "~/Library/Preferences/xyz.yetone.apps.plist",
  ]
end
