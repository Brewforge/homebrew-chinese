cask "gimp-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "3.0.8,1"
  sha256 arm:   "da83a0ae4c6d50abcbecb821a3cc43f75902572df1b7549700c9fab10f73d16d",
         intel: "52b562091cffc8e935fc6c30738f04867a5c270ae8f0753bfde05d7564c22759"

  url "https://mirrors.ustc.edu.cn/gimp/v#{version.major_minor}/macos/gimp-#{version.csv.first}-#{arch}#{"-#{version.csv.second}" if version.csv.second}.dmg",
      verified: "mirrors.ustc.edu.cn/gimp/"
  name "GIMP development version"
  desc "Free and open-source image editor"
  homepage "https://gimp.org/"

  livecheck do
    url "https://gimp.org/gimp_versions.json"
    strategy :json do |json|
      json["STABLE"]&.map do |release|
        release["macos"]&.map do |build|
          next unless build["filename"]&.match?(/#{arch}/i)
          next release["version"] unless build["revision"]

          "#{release["version"]},#{build["revision"]}"
        end
      end&.flatten
    end
  end

  auto_updates true
  conflicts_with cask: ["gimp", "gimp-dev"]
  depends_on macos: ">= :big_sur"

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
