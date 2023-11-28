cask "ryujinx" do
  version "1.1.1065"
  sha256 "dd301f1d1ddf00bed06965876c719afcecac70651a2106a935535489f5b6883b"

  url "https://github.com/Ryujinx/release-channel-master/releases/download/#{version}/test-ava-ryujinx-#{version}-macos_universal.app.tar.gz",
      verified: "github.com/Ryujinx/release-channel-master/"
  name "Ryujinx"
  desc "Simple, experimental Nintendo Switch emulator"
  homepage "https://ryujinx.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "ryujinx.app"

  zap trash: [
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
