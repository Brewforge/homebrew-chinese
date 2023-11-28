cask "peazip" do
  version "9.5.0"
  sha256 "3855825eaeb983c1544aa0bc9dfb4efcc3111e52ff365ea2c4336415b730b45d"

  url "https://github.com/peazip/PeaZip/releases/download/#{version}/peazip-#{version}.DARWIN.aarch64.dmg"
  name "Peazip"
  desc "Free Zip/Unzip software and Rar file extractor"
  homepage "https://github.com/peazip/PeaZip"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "PeaZip.app"

  postflight do
    system_command "/usr/bin/open", args: ["#{staged_path}/macOS service menus/PeaZip, add to archive.workflow"]
    system_command "/usr/bin/open",
                   args: ["#{staged_path}/macOS service menus/PeaZip, extract here (smart new folder).workflow"]
    system_command "/usr/bin/open", args: ["#{staged_path}/macOS service menus/PeaZip, extract....workflow"]
    system_command "/usr/bin/open", args: ["#{staged_path}/macOS service menus/PeaZip, open file or folder.workflow"]
  end

  zap trash: [
    "~/.config/peazip",
    "~/Library/Preferences/com.company.peazip.plist",
    "~/Library/Saved Application State/com.company.peazip.savedState",
  ]
end
