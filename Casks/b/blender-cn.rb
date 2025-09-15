cask "blender-cn" do
  arch arm: "arm64", intel: "x64"

  version "4.5.3"
  sha256 arm:   "73ea841053b55404bb3a71a9a22366f1f8821787fe5c899f8b55a7fff929d01b",
         intel: "c1fd8f30eef1b37918659ad65c504d30cebd3e5bac74dd54f7df1a311aeebe18"

  url "https://mirror.nju.edu.cn/blender/release/Blender#{version.major_minor}/blender-#{version}-macos-#{arch}.dmg",
      verified: "mirror.nju.edu.cn/"
  name "Blender"
  desc "3D creation suite"
  homepage "https://blender.org/"

  livecheck do
    url "https://www.blender.org/download/"
    regex(%r{href=.*?/blender[._-]v?(\d+(?:\.\d+)+)[._-]macos[._-]#{arch}\.dmg}i)
  end

  auto_updates true
  conflicts_with cask: "homebrew/cask-versions/blender-lts"
  depends_on macos: ">= :high_sierra"

  app "Blender.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/blender.wrapper.sh"
  binary shimscript, target: "blender"

  preflight do
    # make __pycache__ directories writable, otherwise uninstall fails
    FileUtils.chmod "u+w", Dir.glob("#{staged_path}/*.app/**/__pycache__")

    File.write shimscript, <<~EOS
      #!/bin/bash
      '#{appdir}/Blender.app/Contents/MacOS/Blender' "$@"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/Blender",
    "~/Library/Saved Application State/org.blenderfoundation.blender.savedState",
  ]
end
