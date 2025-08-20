cask "blender-cn" do
  arch arm: "arm64", intel: "x64"

  version "4.5.1"
  sha256 arm:   "99dcd51528cc06bd872bb28867f6663c21332f4986cc87bea95131da93a23e0f",
         intel: "c7922b8afc194d82800a8926f842162007e365d72e955a319164cb2c4662e049"

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
