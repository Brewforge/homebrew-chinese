cask "gimp-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "2.10.38"
  sha256 arm:   "509d544470e61570a645940ebc1229145abdf995829a8ef0f5296c7408e9a2d6",
         intel: "cf0c79201f54b0c8978ba43806199f0d85bb0ac8db3e77f9dc4f6f4393a9d836"

  url "https://mirrors.ustc.edu.cn/gimp/v#{version.major_minor}/osx/gimp-#{version}-#{arch}.dmg",
      verified: "mirrors.ustc.edu.cn/gimp/"
  name "GIMP development version"
  desc "Free and open-source image editor"
  homepage "https://www.gimp.org/"

  livecheck do
    url "https://www.gimp.org/downloads/"
    regex(%r{href=.*?/gimp-(\d+(?:\.\d+)+)-#{arch}(-\d)?\.dmg}i)
  end

  auto_updates true
  conflicts_with cask: ["gimp", "gimp-dev"]

  app "GIMP.app"
  shimscript = "#{staged_path}/gimp.wrapper.sh"
  binary shimscript, target: "gimp"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      "#{appdir}/GIMP.app/Contents/MacOS/gimp" "$@"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/Gimp",
    "~/Library/Preferences/org.gimp.gimp-#{version.major_minor}:.plist",
    "~/Library/Saved Application State/org.gimp.gimp-#{version.major_minor}:.savedState",
  ]
end
