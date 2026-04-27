cask "tiny-rdm" do
  arch arm: "arm64", intel: "intel"

  version "1.2.7"
  sha256 arm:   "aaebc58a1f97505743bf05f2ab1cfc5e7c3e5841d90266ad836eaab74435f1a3",
         intel: "3d8e61fa474ae50b61e41a623841fcdd7629615fa105758f2840fff75fe857ad"

  url "https://github.com/tiny-craft/tiny-rdm/releases/download/v#{version}/TinyRDM_#{version}_mac_#{arch}.dmg",
      verified: "github.com/tiny-craft/tiny-rdm/"
  name "Tiny RDM"
  desc "Redis desktop manager"
  homepage "https://redis.tinycraft.cc/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Tiny RDM.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Tiny RDM.app"]
  end

  zap trash: [
    "~/Library/Application Support/Tiny RDM",
    "~/Library/Caches/Tiny RDM",
    "~/Library/Preferences/com.tinycraft.tinyrdm.plist",
    "~/Library/Saved Application State/com.tinycraft.tinyrdm.savedState",
  ]
end
