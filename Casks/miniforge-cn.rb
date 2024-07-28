cask "miniforge-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "24.3.0-0"
  sha256 arm:   "9b3c3d9fa30437592e680390f2b27d45c5d5cfcbfad9a1af233f70a6d8be71a1",
         intel: "26a80621b146d60e5ae0d896b83ec138416653b951286361b1f93a804cb6a8d9"

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
