cask "mambaforge-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "23.11.0-0"
  sha256 arm:   "dd832d8a65a861b5592b2cf1d55f26031f7c1491b30321754443931e7b1e6832",
         intel: "c6ac073b80cedb313561bc11c2e61b0bd102b74df0363ed6c1e90303b322092a"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/conda-forge/miniforge/LatestRelease/Mambaforge-#{version}-MacOSX-#{arch}.sh",
      verified: "mirrors.tuna.tsinghua.edu.cn/github-release/conda-forge/miniforge/"
  name "mambaforge"
  desc "Minimal installer for conda with preinstalled support for Mamba"
  homepage "https://github.com/conda-forge/miniforge"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/github-release/conda-forge/miniforge/LatestRelease"
    regex(/Mambaforge[._-](\d+(?:[.-]\d+)+)[._-]MacOSX[._-]#{arch}\.sh/i)
  end

  auto_updates true
  conflicts_with cask: %w[
    mambaforge
    miniconda
    miniforge
    miniforge-cn
  ]
  container type: :naked

  installer script: {
    executable: "Mambaforge-#{version}-MacOSX-#{arch}.sh",
    args:       ["-b", "-p", "#{caskroom_path}/base"],
  }
  binary "#{caskroom_path}/base/condabin/conda"

  uninstall delete: "#{caskroom_path}/base"

  zap trash: [
    "~/.condarc",
    "~/.conda",
  ]

  caveats <<~EOS
    Please run the following to setup your shell:
      conda init "$(basename "${SHELL}")"
  EOS
end
