cask "blender@lts-cn" do
  version "5.2.4"
  sha256 "e73d564f97061b2496ccc5a0bd738937d2d3d0acae23621a00bbc7534dfd135f"

  url "https://mirrors.tuna.tsinghua.edu.cn/blender/release/Blender#{version.major_minor}/blender-#{version}-macos-arm64.dmg"
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
  depends_on macos: :big_sur

  app "Blender.app"
  command_wrapper "blender",
                  executable: "#{appdir}/Blender.app/Contents/MacOS/Blender"

  preflight_steps do
    set_permissions "*.app/**/__pycache__", "u+w", recursive: false
  end

  zap trash: [
    "~/Library/Application Support/Blender",
    "~/Library/Caches/Blender",
    "~/Library/Saved Application State/org.blenderfoundation.blender.savedState",
  ]
end
