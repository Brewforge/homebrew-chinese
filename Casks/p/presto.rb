cask "presto" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.8"
  sha256 arm:   "26fe041668d0cc68a20a582828f53c67ec2dd0ba3525ba22a522460b0f281a2d",
         intel: "15aa32c53be56f4dbb80502aa6d28658bf0db8054690c7100d0d0387a9947a2f"

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
