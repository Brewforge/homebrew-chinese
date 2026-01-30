cask "sparkle" do
  arch arm: "arm64", intel: "x64"

  version "1.26.1"
  sha256 arm:   "86a81afdd2e07791870d437885aed197a3c386ff5358d920f917b75f7cf66ec7",
         intel: "dec1aaaa9afa2310f95accc2e50b25342ebbc668b9d60506d3797898a7428774"

  url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-#{arch}.pkg"
  name "sparkle"
  desc "Another Mihomo GUI"
  homepage "https://github.com/xishang0128/sparkle"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">=:big_sur"

  pkg "sparkle-macos-#{version}-#{arch}.pkg"

  uninstall quit:    "org.sparkle-project.SparkleTestApp",
            pkgutil: "org.sparkle-project.SparkleTestApp"

  zap trash: [
    "~/Library/Application Scripts/org.sparkle-project.SparkleTestApp",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.sparkle-project.sparkletestapp.sfl*",
    "~/Library/Containers/org.sparkle-project.SparkleTestApp",
    "~/Library/Preferences/org.sparkle-project.SparkleTestApp.plist",
  ]
end
