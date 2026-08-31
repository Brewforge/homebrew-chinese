cask "sparkle" do
  arch arm: "arm64", intel: "x64"

  version "1.26.8"
  sha256 arm:   "4de46fa6871200ba4e7bf487e3e7920e9dc0190ffb89fef1d4e77db262cf26c1",
         intel: "b398689ec8397f5fb61a8df4007a13f3e5ef10f1f3571d8348bc1c02a6305696"

  url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-#{arch}.pkg"
  name "sparkle"
  desc "Another Mihomo GUI"
  homepage "https://github.com/xishang0128/sparkle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

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
