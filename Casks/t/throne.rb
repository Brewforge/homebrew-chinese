cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.5"
  sha256 arm:   "bbdad03b0e46fcc4b9c0bfc3c8a60a48e87410b6aaad27c64f74574fcaef6d3c",
         intel: "8aab23c3bb7501747c892c3f08197c7ce08b208f52765988becbfa8a56331458"

  url "https://github.com/throneproj/Throne/releases/download/#{version}/Throne-#{version}-macos-#{arch}.zip"
  name "Throne"
  desc "Cross-platform GUI proxy utility"
  homepage "https://github.com/throneproj/Throne"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :big_sur

  app "Throne/Throne.app"

  zap trash: "~/Library/Preferences/Throne"
end
