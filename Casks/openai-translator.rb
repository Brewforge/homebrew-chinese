cask "openai-translator" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.39"
  sha256 arm:   "29f43cde238c63659e6e031c21b8af49d50bb3d9692c60f43e266ee671ac8755",
         intel: "63a7d26ae2cbcee0e7392a164d3bfb8fce9a85e39423e94453e4c5bd391cc7de"

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
