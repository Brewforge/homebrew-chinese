cask "vibeviewer" do
  version "1.1.11"
  sha256 "09627ba374e4e1ca304372304c7c6931e74c9ab46c3eb51da79a42f0b8252a6e"

  url "https://github.com/MarveleE/Vibeviewer/releases/download/v#{version}/Vibeviewer-#{version}.dmg"
  name "Vibeviewer"
  desc "菜单栏工具用于跟踪光标使用情况"
  homepage "https://github.com/MarveleE/Vibeviewer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Vibeviewer.app"

  preflight do
    system_command "xattr", args: ["-cr", "#{staged_path}/Vibeviewer.app"]
  end

  zap trash: "~/Library/Preferences/com.magicgroot.vibeviewer.plist"
end
