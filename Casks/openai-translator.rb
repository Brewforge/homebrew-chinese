cask "openai-translator" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.48"
  sha256 arm:   "9c8efe026857c5f095375efc675ca8fa1a67a95dfb1fe07c0f77553fc9b00dcd",
         intel: "2695c31cfcc7a9381793864cc01d82056fda3ee1e9ac70291f4dc77f3aefc969"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/openai-translator/openai-translator/releases/download/v#{version}/OpenAI.Translator_#{version}_#{arch}.dmg"

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
