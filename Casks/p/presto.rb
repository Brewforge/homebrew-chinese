cask "presto" do
  arch arm: "arm64", intel: "amd64"

  version "0.5.3"
  sha256 arm:   "126a03666d294c9ceb69584d925d01703a0cb2a5d5185ae860b44536ed40a130",
         intel: "07aff8d055c2f6c94c584483caee5c03e5391b1b29702e4a86946b678379ea9c"

  url "https://github.com/Presto-io/Presto/releases/download/v#{version}/Presto-#{version}-macOS-#{arch}.dmg",
      verified: "github.com/Presto-io/Presto/"
  name "Presto"
  desc "Markdown to PDF document conversion tool powered by Typst"
  homepage "https://presto.mre.red/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Presto.app"

  preflight do
    system_command "xattr", args: ["-cr", "#{staged_path}/Presto.app"]
  end

  zap trash: []
end
