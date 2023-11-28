cask "freefilesync" do
  version "13.1"
  sha256 :no_check

  url "https://www.freefilesync.org/download/FreeFileSync_#{version}_macOS.zip"
  name "FreeFileSync"
  desc "Folder comparison and synchronization software"
  homepage "https://www.freefilesync.org/"

  auto_updates true

  pkg "FreeFileSync_#{version}.pkg"
end
