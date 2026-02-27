cask "presto" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.6"
  sha256 arm:   "0539be06e79db4a5f123ecd500a75dda5998c49451c517036e8c8ae431bdedf4",
         intel: "f167cb156e197f753de5912f90704d209839937f3ff9d4ef717e038bc25b3764"

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
