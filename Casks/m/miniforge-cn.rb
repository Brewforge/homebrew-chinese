cask "miniforge-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "25.11.0-0"
  sha256 arm:   "e661edc406c2e4894e965e4279fdc295650dceb6e1f3a851e38c8768e6312522",
         intel: "9c6a6b0ce89348adcb70ef221a6b289442c20173fff27a2c54a8397de02ce496"

  url "https://mirror.nju.edu.cn/github-release/conda-forge/miniforge/LatestRelease/Miniforge3-#{version}-MacOSX-#{arch}.sh",
      verified: "mirror.nju.edu.cn/github-release/conda-forge/miniforge/"
  name "miniforge"
  desc "Minimal installer for conda specific to conda-forge"
  homepage "https://github.com/conda-forge/miniforge"

  livecheck do
    url "https://mirror.nju.edu.cn/github-release/conda-forge/miniforge/LatestRelease"
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
