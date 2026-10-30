cask "blender-cn" do
  version "5.2.3"
  sha256 "acc05374485a272342d4b323c15ac01953e7f697da2f1bad8af9c3bf087267a4"

  url "https://mirrors.tuna.tsinghua.edu.cn/blender/release/Blender#{version.major_minor}/blender-#{version}-macos-arm64.dmg"
  name "Blender"
  desc "3D creation suite"
  homepage "https://www.blender.org/"

    livecheck do
      url "https://download.blender.org/release/"
      regex(/href=.*?blender[._-]v?(\d+(?:\.\d+)+)(?:[._-]macos)?[._-]#{arch}\.dmg/i)
      strategy :page_match do |page, regex|
        # Match major/minor versions from stable directory names
        major_minor_versions =
          page.scan(%r{href=["']?[^"' >]*?Blender[._-]?v?(\d+(?:\.\d+)+)/?["' >]}i)
              .flatten
              .uniq
              .sort_by { |v| Version.new(v) }
        next if major_minor_versions.blank?

        # Check the directory listing page for the highest major/minor version
        directory_page = Homebrew::Livecheck::Strategy.page_content(
          URI.join(@url, "Blender#{major_minor_versions.last}/").to_s,
        )[:content]
        next if directory_page.blank?

        directory_page.scan(regex).map { |match| match[0] }
      end
    end
  end

  conflicts_with cask: %w[
    blender
    blender@lts
    blender@lts-cn
  ]
  depends_on arch: :arm64
  depends_on :macos

  app "Blender.app"
  command_wrapper "blender",
                  executable: "#{appdir}/Blender.app/Contents/MacOS/Blender"

  preflight_steps do
    set_permissions "*.app/**/__pycache__", "u+w", recursive: false
  end

  zap trash: [
    "~/Library/Application Support/Blender",
    "~/Library/Saved Application State/org.blenderfoundation.blender.savedState",
  ]
end
