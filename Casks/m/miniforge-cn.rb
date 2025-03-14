cask "miniforge-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "24.11.3-2"
  sha256 arm:   "a20f9dd033fcdb26329abab726bfddf22de44bf1d37030bb212cf52120b26618",
         intel: "164f9891ca2338d9c748d1d007d081d1206ae255264df201493204b93b8ba484"

  url "https://mirrors.bfsu.edu.cn/github-release/conda-forge/miniforge/LatestRelease/Miniforge3-#{version}-MacOSX-#{arch}.sh",
      verified: "mirrors.bfsu.edu.cn/github-release/conda-forge/miniforge/"
  name "miniforge"
  desc "Minimal installer for conda specific to conda-forge"
  homepage "https://github.com/conda-forge/miniforge"

  livecheck do
    url "https://mirrors.bfsu.edu.cn/github-release/conda-forge/miniforge/LatestRelease"
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
