cask "blender-cn" do
  arch arm: "arm64", intel: "x64"

  version "4.3.2"
  sha256 arm:   "32297d20fae74683052267b9171945712c0aeb8a499d8e677e44740d3e30a034",
         intel: "3894df9f3034b177c96a386ef017aa3a0e9cf1859fedbfe731a19438188ec8c6"

  url "https://mirrors.tuna.tsinghua.edu.cn/blender/release/Blender#{version.major_minor}/blender-#{version}-macos-#{arch}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/"
  name "Blender"
  desc "3D creation suite"
  homepage "https://blender.org/"

  livecheck do
    url "https://blender.org/download/"
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
