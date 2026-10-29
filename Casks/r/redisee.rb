cask "redisee" do
  arch arm: "arm64", intel: "x64"

  version "1.1.10"
  sha256 arm:   "2bff611306d735b98bf9c5468b562aa52d439683729937ce3d9f0cd2ddffdbfb",
         intel: "b22c8ce5d98577601347e88f677025cb707aaa466c521e55953933312c433c91"

  url "https://download.redisee.com/#{version}/Redisee-#{version}-osx-#{arch}.dmg"
  name "Redisee"
  desc "Redis desktop manager"
  homepage "https://redisee.com/"

  livecheck do
    url "https://github.com/tiny-craft/redisee-app"
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Redisee.app"

  zap trash: [
    "~/Library/Application Support/Redisee",
    "~/Library/Logs/velopack_Redisee.log",
    "~/Library/Preferences/com.redisee.desktop.plist",
  ]
end
