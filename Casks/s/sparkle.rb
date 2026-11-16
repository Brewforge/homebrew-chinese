cask "sparkle" do
  arch arm: "arm64", intel: "x64"

  version "1.26.10"
  sha256 arm:   "4fce4ea073f2ee0320847512460f325f7d345e42009abb156f21986b7d7755ba",
         intel: "80a5f2e95f407d08193978f4e636b9281f1a2c695fddcd786a4ca7e60dd54311"

  url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-#{arch}.pkg"
  name "sparkle"
  desc "Another Mihomo GUI"
  homepage "https://github.com/xishang0128/sparkle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

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
