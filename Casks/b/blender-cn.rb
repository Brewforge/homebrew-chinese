cask "blender-cn" do
  arch arm: "arm64", intel: "x64"

  version "4.4.0"
  sha256 arm:   "c3a1192d36d6202cd233081a54391c5778f3dd7aa3ca5af077f641e87a412104",
         intel: "e387e88b569afd0c569da0ff6b0615a882615f3047d94633cc87b288a4b09c54"

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
