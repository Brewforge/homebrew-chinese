cask "openai-translator" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.14"
  sha256 arm:   "fdae4dbc55ce4e74275d6b6cc760bbb59d9e73ed2b9ba7d9f43b4de018d16a44",
         intel: "847b55cebab6c26ba47a030cfa648d1821e6643e9ab1778d4413cb11caaf459f"

  url "https://github.com/openai-translator/openai-translator/releases/download/v#{version}/OpenAI.Translator_#{version}_#{arch}.dmg"
  name "OpenAI Translator"
  desc "Cross-platform Translatior based on ChatGPT API"
  homepage "https://github.com/openai-translator/openai-translator"

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
