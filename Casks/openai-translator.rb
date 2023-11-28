cask "openai-translator" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.89"
  sha256 arm:   "0c6f2d261baaf8b2472465d6bd2fbf1535881cdf9c5facd7ef1e59b3c6bcc5e0",
         intel: "e9d9f930f7837de810888e6869a80f7022a43826a6f9a4dbbc48a38e4855375f"

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
