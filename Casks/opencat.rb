cask "opencat" do
  version "2.0.1.410"
  sha256 "9a5010912a4bc8ca8c958e945660b890784e82b57e05c618521a92fef20a990f"

  url "https://opencat.app/releases/OpenCat-#{version}.dmg"
  name "OpenCat"
  desc "Native AI chat client, offering a smoother and faster chat experience"
  homepage "https://opencat.app/"

  auto_updates true
  app "OpenCat.app"

  livecheck do
    url "https://opencat.app"
    regex(/OpenCat[._-]v?(\d+(?:\.\d+)+)/i)
  end

  zap trash: []
end
