cask "openai-translator" do
  version "0.4.18"
  sha256 "e86e2b6f80a50bfbb222425c97862cb49b3434da591fa3446e8d3227554a9630"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/openai-translator/openai-translator/releases/download/v#{version}/OpenAI.Translator_#{version}_aarch64.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "OpenAI Translator"
  desc "Cross-platform Translatior based on ChatGPT API"
  homepage "https://github.com/openai-translator/openai-translator"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true

  app "OpenAI Translator.app"

  zap trash: [
    "~/Library/Application Support/xyz.yetone.apps.openai-translator",
    "~/Library/Caches/xyz.yetone.apps.openai-translator",
    "~/Library/Logs/DiagnosticReports/OpenAI Translator-2024-03-02-230629.ips",
    "~/Library/Saved Application State/xyz.yetone.apps.openai-translator.savedState",
    "~/Library/WebKit/xyz.yetone.apps.openai-translator",
  ]
end
