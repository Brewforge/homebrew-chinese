cask "openai-translator" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.11"
  sha256 arm:   "37b49be987699f66abe7835d574bbd652865f2ae9a0730439b931980ccf5c770",
         intel: "f030986b7f6f8bb4f94a1cedf5a659294b450a2008ad3dd96c129092be6faee2"

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
