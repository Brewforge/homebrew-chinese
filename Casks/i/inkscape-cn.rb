cask "inkscape-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.028868"
  sha256 arm:   "c2d89809ad8d85021e7784e72e28aee2231b0b8675ec3ede3e6fb9f1ffedb4b3",
         intel: "e3f968e131e5c3577ee21809da487eafe2a9b42370e2bf408e5811b6f965912e"

  url "https://mirror.nju.edu.cn/inkscape/Inkscape-#{version}_#{arch}.dmg",
      verified: "mirror.nju.edu.cn/inkscape/"
  name "Inkscape"
  desc "Vector graphics editor"
  homepage "https://inkscape.org/"

  livecheck do
    url "https://mirror.nju.edu.cn/inkscape"
    regex(/Inkscape-(\d+(\.\d+)+)_#{arch}\.dmg/i)
  end

  auto_updates true

  app "Inkscape.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/inkscape.wrapper.sh"
  binary shimscript, target: "inkscape"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec '#{staged_path}/Inkscape.app/Contents/MacOS/inkscape' "$@"
    EOS
  end

  zap trash: [
    "~/.config/inkscape",
    "~/Library/Application Support/Inkscape",
    "~/Library/Application Support/org.inkscape.Inkscape",
    "~/Library/Caches/org.inkscape.Inkscape*",
    "~/Library/Preferences/org.inkscape.Inkscape.plist",
    "~/Library/Saved Application State/org.inkscape.Inkscape.savedState",
  ]
end
