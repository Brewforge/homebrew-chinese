cask "happ" do
  version "4.1.1"
  sha256 "31b900f983e5a3113af59e7fb29c5d16e91e222e31fe794a3c70509619b48122"

  url "https://github.com/Happ-proxy/happ-desktop/releases/download/#{version}/Happ.macOS.universal.dmg"
  name "Happ"
  desc "Proxy Utility"
  homepage "https://www.happ.su/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Happ.app"

  zap trash: [
    "~/Library/Application Support/Happ",
    "~/Library/Caches/Happ",
    "~/Library/Caches/com.happ.www",
    "~/Library/Preferences/com.happ.plist",
    "~/Library/Preferences/com.happ.www.plist",
    "~/Library/Saved Application State/com.happ.www.savedState",
  ]
end
