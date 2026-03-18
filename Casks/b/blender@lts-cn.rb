cask "blender@lts-cn" do
  arch arm: "arm64", intel: "x64"

  version "4.5.7"
  sha256 arm:   "e19e353486ebe79fd61b7b1424971c44abd8dfd20dd6dd43753e78c3e3f30704",
         intel: "7bc6d2fed3ac4c49c82959868b9f8086315573a3e4cdcee16de2dec93010a1a8"

  url "https://mirrors.tuna.tsinghua.edu.cn/blender/release/Blender#{version.major_minor}/blender-#{version}-macos-#{arch}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/"
  name "Blender"
  desc "Free and open-source 3D creation suite"
  homepage "https://www.blender.org/"

  livecheck do
    skip "Cannot be fetched due to Cloudflare protections"
  end

  conflicts_with cask: %w[
    blender
    blender-cn
    blender@lts
  ]
  depends_on macos: ">= :big_sur"

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
