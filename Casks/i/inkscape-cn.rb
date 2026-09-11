cask "inkscape-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.230579"
  sha256 arm:   "118e9e23190eea1265592a8b2053f5fb67e13a55b9311b2ab284df7008a896b4",
         intel: "f0b05d5195e3aa0ba9d6d6a972f1d7f57abd876532b4d6eb02ecc98c0dcdfdbf"

  url "https://mirror.nju.edu.cn/inkscape/Inkscape-#{version}_#{arch}.dmg"
  name "Inkscape"
  desc "Vector graphics editor"
  homepage "https://inkscape.org/"

  livecheck do
    url "https://mirror.nju.edu.cn/inkscape"
    regex(/Inkscape-(\d+(\.\d+)+)_#{arch}\.dmg/i)
  end

  depends_on :macos

  app "Inkscape.app"
  command_wrapper "inkscape", executable: "#{appdir}/Inkscape.app/Contents/MacOS/inkscape"

  zap trash: [
    "~/.config/inkscape",
    "~/Library/Application Support/Inkscape",
    "~/Library/Application Support/org.inkscape.Inkscape",
    "~/Library/Caches/org.inkscape.Inkscape*",
    "~/Library/Preferences/org.inkscape.Inkscape.plist",
    "~/Library/Saved Application State/org.inkscape.Inkscape.savedState",
  ]
end
