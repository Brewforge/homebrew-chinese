cask "sparkle" do
  arch arm: "arm64", intel: "x64"

  version "1.6.15"
  sha256 arm:   "b2a827dec0c6fe8c38be3067877f845dfa7961b352a6a19971e7cfb1cceb2111",
         intel: "5644cb13e78d6e92ea9c01ff4b1c155ce74409d913a43acdea18508d0399452b"

  url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-#{arch}.pkg"
  name "sparkle"
  desc "Another Mihomo GUI"
  homepage "https://github.com/xishang0128/sparkle"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  pkg "sparkle-macos-#{version}-#{arch}.pkg"

  uninstall quit:    "org.sparkle-project.SparkleTestApp",
            pkgutil: "org.sparkle-project.SparkleTestApp"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/org.sparkle-project.SparkleTestApp",
    "~/Library/Application Scripts/org.sparkle-project.SparkleTestApp",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.sparkle-project.sparkletestapp.sfl*",
    "~/Library/Containers/org.sparkle-project.SparkleTestApp",
    "~/Library/Preferences/org.sparkle-project.SparkleTestApp.plist",
  ]
end
