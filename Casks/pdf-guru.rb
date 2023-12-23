cask "pdf-guru" do
  arch arm: "amd64", intel: "amd64"

  version "1.0.12"
  sha256 :no_check

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/kevin2li/PDF-Guru/releases/download/v#{version}/pdf-guru-darwin-#{arch}-#{version}.zip"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "PDF Guru"
  desc "Multi-purpose PDF file processing tool with a nice UI"
  homepage "https://github.com/kevin2li/PDF-Guru/"

  livecheck do
    url :url
    regex(/darwin-.*?v?(\d+(?:\.\d+)+)/i)
    strategy :header_match
  end

  auto_updates true

  app  "PDF Guru.app"

  zap trash: []
end
