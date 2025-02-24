cask "cajviewer" do
  version "9.5.0.25014"
  sha256 "bcee837286a58eb786230115d53a0f69448b22cc126621b811cb147f98f03034"

  url "https://download.cnki.net/cajPackage/CAJMACPackage/CAJViewer_#{version}_arm64.dmg"
  name "CAJViewer"
  desc "专业文献阅读器"
  homepage "https://CAJViewer.cnki.net/download.html"

  livecheck do
    url :url
    regex(/CAJViewer_#{arch}_(.+)_arm64\.dmg/i)
  end

  auto_updates true

  app "CAJViewer.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/CAJViewer.app"]
  end

  zap trash: []
end
