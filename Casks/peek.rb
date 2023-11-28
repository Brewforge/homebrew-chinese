cask "peek" do
  arch arm: "-arm64-", intel: "-"

  version "3.0.0"
  sha256 arm:   "619a187b374b4a31d13cb781575a2106d76251133befe21f7776a91ea1fd7dfb",
         intel: "aa339af1cbd5483dc43fc38a66f1e09ee17f82fac2be4d0169c7aa8c96e60eb9"

  url "https://github.com/prateekkeshari/peek-ai/releases/download/#{version}/Peek-#{version}#{arch}mac.zip",
      verified: "github.com/prateekkeshari/peek-ai/"
  name "Peek"
  desc "Access to ChatGPT Bard Poe Pi Perplexity Claude Labs on MacOS Menu Bar"
  homepage "https://prateekkeshari.gumroad.com/l/peek"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Peek.app"

  zap trash: [
    "~/Library/Logs/Peek",
    "~/Library/Preferences/de.prateek.peek.plist",
    "~/Library/Saved Application State/de.prateek.peek.savedState",
    "~/Library/Application Support/Peek",
  ]
end
