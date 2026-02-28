cask "presto" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.7"
  sha256 arm:   "cdf7ec83443c9b2f52c0cc6fadc83fb219b4e3c0ae89ea1dbbd60020c6aaff80",
         intel: "7a1a6062a6f6d87bb246d367a3d5b2db1d000b38545da74a0a040eb5b269b3f8"

  url "https://github.com/Presto-io/Presto/releases/download/v#{version}/Presto-#{version}-macOS-#{arch}.dmg"
  name "Presto"
  desc "Markdown to PDF document conversion tool powered by Typst"
  homepage "https://github.com/Presto-io/Presto"

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
