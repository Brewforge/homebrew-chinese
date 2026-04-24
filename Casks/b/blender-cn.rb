cask "blender-cn" do
  version "5.1.1"
  sha256 "ff6219b3aaab4d9adf548b9a32b3b31764fe740b6c741d16660c5c0f4ffe9841"

  url "https://mirrors.tuna.tsinghua.edu.cn/blender/release/Blender#{version.major_minor}/blender-#{version}-macos-arm64.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/"
  name "Blender"
  desc "3D creation suite"
  homepage "https://www.blender.org/"

  livecheck do
    url "https://download.blender.org/release/"
    regex(/href=.*?blender[._-]v?(\d+(?:\.\d+)+)-macos-arm64\.dmg/i)
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

  auto_updates true
  conflicts_with cask: %w[
    blender
    blender@lts
    blender@lts-cn
  ]
  depends_on arch: :arm64
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
