cask "mambaforge-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "24.3.0-0"
  sha256 arm:   "de7c7f229d05104de802f1f729a595736b08139c4ae59ba8ba0049050d63c98f",
         intel: "5455900cf1298f21333b7c0d1ec159952e1ef5426563cc97eb7e42053d608afc"

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
    "~/.conda",
    "~/.condarc",
  ]

  caveats <<~EOS
    Please run the following to setup your shell:
      conda init "$(basename "${SHELL}")"
  EOS
end
