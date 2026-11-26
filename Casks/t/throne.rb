cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.4.5"
  sha256 arm:   "853f006ea1b35fb3279e072f710dff3a9c8d503c9f511377db40408438e9db88",
         intel: "dd6353869a4ec4e7c2f3b94f3daf9359697e92d0d64e571d964f5b49d7fde216"

  url "https://github.com/throneproj/Throne/releases/download/#{version}/Throne-#{version}-macos-#{arch}.zip"
  name "Throne"
  desc "Cross-platform GUI proxy utility"
  homepage "https://github.com/throneproj/Throne"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Throne/Throne.app"

  zap trash: "~/Library/Preferences/Throne"
end
