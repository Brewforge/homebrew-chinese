cask "corretto-8" do
  arch arm: "aarch64", intel: "x64"

  version "8.392.08.1"
  sha256 arm:   "c9c9d9004ed11487a37a274cb1e230bc90ff730ea78cefd7fcd75c635e82c650",
         intel: "f6524417a1c9cef7c4e766409809ddcdbcd9ed5f2e0bd777804c7cc4a6055eac"

  url "https://corretto.aws/downloads/resources/#{version}/amazon-corretto-#{version}-macosx-#{arch}.pkg",
      verified: "corretto.aws/downloads/resources/"
  name "amazon-corretto-8"
  desc "Open-source Version Control System for Machine Learning Projects"
  homepage "https://github.com/corretto/corretto-8"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: ">= :mojave"

  pkg "amazon-corretto-#{version}-macosx-#{arch}.pkg"

  uninstall pkgutil: "com.amazon.corretto.#{version.major}"

  zap trash: []
end
