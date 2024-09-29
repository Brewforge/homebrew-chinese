cask "miniforge-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "24.7.1-2"
  sha256 arm:   "cafa7cc6d7baef6ea292880ae46c6c9d28bc1156394a418ceada30118d8b6b9a",
         intel: "ec6150160703ee622e6520863f68c5130473b69558aed822c4e369e90ef42aad"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/conda-forge/miniforge/LatestRelease/Miniforge3-#{version}-MacOSX-#{arch}.sh",
      verified: "mirrors.tuna.tsinghua.edu.cn/github-release/conda-forge/miniforge/"
  name "miniforge"
  desc "Minimal installer for conda specific to conda-forge"
  homepage "https://github.com/conda-forge/miniforge"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/github-release/conda-forge/miniforge/LatestRelease"
    regex(/Miniforge3-(\d+(?:[.-]\d+)+)-MacOSX-#{arch}\.sh/i)
  end

  auto_updates true
  conflicts_with cask: %w[
    mambaforge
    mambaforge-cn
    miniconda
    miniforge
  ]
  container type: :naked

  installer script: {
    executable: "Miniforge3-#{version}-MacOSX-#{arch}.sh",
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
