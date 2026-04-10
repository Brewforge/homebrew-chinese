cask "presto" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.0"
  sha256 arm:   "edca27e9932b798fd90b2acffc405c55e375df4189eace92b2c35c2665baa717",
         intel: "a63443d4f612a58cd15a6094e50fbf65f1b13b7a14b3507ddda40860111db7e7"

  url "https://github.com/Presto-io/Presto/releases/download/v#{version}/Presto-#{version}-macOS-#{arch}.dmg",
      verified: "github.com/Presto-io/Presto/"
  name "Presto"
  desc "Markdown to PDF document conversion tool powered by Typst"
  homepage "https://presto.mre.red/"

  livecheck do
    # url :url
    # strategy :github_latest
    skip "The newer version does not have GitHub releases"
  end

  depends_on macos: ">= :big_sur"

  app "Presto.app"

  preflight do
    system_command "xattr", args: ["-cr", "#{staged_path}/Presto.app"]
  end

  zap trash: []
end
