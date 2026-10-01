cask "sparkle" do
  arch arm: "arm64", intel: "x64"

  version "1.26.9"
  sha256 arm:   "301e1daf01b5c836d282e3d0dec779f51e43a8d182b2f850df7a04bcd63cd5ac",
         intel: "a3a60b3c234faa1d9ff99448ebfd4891223887ab63958da45809ab6d26b084ef"

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
