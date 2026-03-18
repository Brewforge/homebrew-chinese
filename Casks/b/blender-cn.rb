cask "blender-cn" do
    version "5.1.0"
    sha256 "ebeda0dbb7fbf06f3cbcf58c11397551de745f1177acfe3e2331ac0d4d901996"

    url "https://mirrors.tuna.tsinghua.edu.cn/blender/release/Blender#{version.major_minor}/blender-#{version}-macos-arm64.dmg",
        verified: "mirrors.tuna.tsinghua.edu.cn/"
    name "Blender"
    desc "3D creation suite"
    homepage "https://www.blender.org/"

    livecheck do
      skip "Cannot be fetched due to Cloudflare protections"
    end

    auto_updates true
    conflicts_with cask: %w[
      blender
      blender@lts
      blender@lts-cn
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
