cask "clash-verge-rev" do
  arch arm: "aarch64", intel: "x64"

  version "1.6.2"
  sha256 arm:   "e06dfa60866b1ab82156956bc97ba63c1c48afaa9295b04b6b13c65899f5279a",
         intel: "9b599dbbe16e95b98c6eeb773fbedc00dc1d9a8d83b1bb4baa5f2753c6e852b1"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v#{version}/Clash.Verge_#{version}_#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "Clash Verge Rev"
  desc "Clash Verge 接盘项目"
  homepage "https://github.com/clash-verge-rev/clash-verge-rev"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "clash-verge"

  app "Clash Verge.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Clash Verge.app"]
  end

  zap trash: [
    "~/.config/clash-verge",
    "~/Library/Application Support/io.github.clash-verge-rev.clash-verge-rev",
    "~/Library/Caches/io.github.clash-verge-rev.clash-verge-rev",
    "~/Library/Preferences/io.github.clash-verge-rev.clash-verge-rev.savedState.plist",
    "~/Library/Saved Application State/io.github.clash-verge-rev.clash-verge-rev.savedState",
    "~/Library/WebKit/io.github.clash-verge-rev.clash-verge-rev",
  ]
end
