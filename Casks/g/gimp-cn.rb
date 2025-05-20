cask "gimp-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "3.0.4"
  sha256 arm:   "bc3002d9221ebed220b9687378275d139b4fd0ea066fe3a2b5788ef2ee4377f3",
         intel: "9a2dc5c194212f9f7b8ab6752c7aaad5c5e38cb211ec526593f4d6d720b76c3f"

  url "https://mirror.nju.edu.cn/gimp/gimp/v#{version.major_minor}/macos/gimp-#{version.csv.first}-#{arch}#{"-#{version.csv.second}" if version.csv.second}.dmg",
      verified: "mirror.nju.edu.cn/gimp/"
  name "GIMP development version"
  desc "Free and open-source image editor"
  homepage "https://www.gimp.org/"

  livecheck do
    url "https://www.gimp.org/gimp_versions.json"
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
  depends_on macos: ">= :high_sierra"

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
