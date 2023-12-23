cask "openai-translator" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.8"
  sha256 arm:   "f238dc89e5f5ad18b21717cd1fa637effff1b96582aa909b8377e3beb65d2232",
         intel: "6b361d92cd6cf6ddbb0b13c3ea6030614b1ffe1412aaa5ba8fe57c6e946bbff3"

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
