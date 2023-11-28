cask "dvc-app" do
  version "3.28.0"
  sha256 :no_check

  url "https://dvc.org/download/osx/dvc-#{version}"
  name "dvc"
  desc "Open-source Version Control System for Machine Learning Projects"
  homepage "https://dvc.org/"

  livecheck do
    url "https://dvc.org/"
    regex(/href=.*?dvc-(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: ">= :mojave"

  pkg "dvc-#{version}.pkg"

  uninstall quit:    "com.iterative.dvc",
            pkgutil: "com.iterative.dvc"

  zap trash: [
    "~/Library/Application Support/dvc",
    "~/Library/Application Support/iterative",
  ]
end
