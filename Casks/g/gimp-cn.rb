cask "gimp-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "3.0.0"
  sha256 arm:   "01226a0325d94066f6b1a1a73d54425eceaeadd2d0525504b8f559d4068cbf24",
         intel: "e1f8350b48f777ac3a1bf5c31894bd69dd0f8ef98fc430c40e7e272765722e56"

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
