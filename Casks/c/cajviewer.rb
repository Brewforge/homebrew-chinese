cask "cajviewer" do
  version "9.5.0.25014"
  sha256 "c2024ac446d760d4e3cd4a81753b6e46b8cfc48dc9ebce2376cb0e1ada5e1974"

  url "https://download.cnki.net/cajPackage/CAJMACPackage/CAJViewer_#{version}_arm64.dmg"
  name "CAJViewer"
  desc "专业文献阅读器"
  homepage "https://CAJViewer.cnki.net/download.html"

  livecheck do
    url :homepage
    regex(/CAJViewer_(\d+(\.\d+)+)_arm64\.dmg/)
  end

  auto_updates true

  app "CAJViewer.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/CAJViewer.app"]
  end

  zap trash: []
end
