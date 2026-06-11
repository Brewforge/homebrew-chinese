cask "miniforge-cn" do
  os macos: "MacOSX", linux: "Linux"

  version "26.3.2-3"
  sha256 arm:          "59168f1e24d0a4ad9932021170809fca836cd240e183eeeb331d5bcfc0098168",
         intel:        "39273e4c89a0a1af4538010615d44ae8f44e1af41007e02def593d20f316b003",
         arm64_linux:  "2c113a69297e612b01ca0f320c22a3107a11f2ab9b573d79ac868a175945ce29",
         x86_64_linux: "848194851a98903134187fbb4ab50efe87b003e0c0f808f97644b7524a62bf2c"

  on_macos do
    arch arm: "arm64", intel: "x86_64"
  end

  on_linux do
    arch arm: "aarch64", intel: "x86_64"
  end

  url "https://mirrors.ustc.edu.cn/github-release/conda-forge/miniforge/LatestRelease/Miniforge3-#{version}-#{os}-#{arch}.sh",
      verified: "mirrors.ustc.edu.cn/github-release/conda-forge/miniforge/"
  name "miniforge"
  desc "Minimal installer for conda specific to conda-forge"
  homepage "https://github.com/conda-forge/miniforge"

  livecheck do
    url "https://mirrors.ustc.edu.cn/github-release/conda-forge/miniforge/LatestRelease"
    regex(/Miniforge3-(\d+(?:[.-]\d+)+)-#{os}-#{arch}\.sh/i)
  end

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
  binary "#{caskroom_path}/base/condabin/mamba"

  postflight do
    if Dir.exist? "#{HOMEBREW_TEMP}/#{token}-envs"
      FileUtils.rm_r "#{caskroom_path}/base/envs"
      FileUtils.mv "#{HOMEBREW_TEMP}/#{token}-envs", "#{caskroom_path}/base/envs"
    end
  end

  uninstall_preflight do
    if Dir.exist? "#{caskroom_path}/base/envs"
      FileUtils.mv "#{caskroom_path}/base/envs", "#{HOMEBREW_TEMP}/#{token}-envs"
    end
  end

  uninstall delete: "#{caskroom_path}/base"

  zap trash: [
    "#{HOMEBREW_TEMP}/#{token}-envs",
    "~/.conda",
    "~/.condarc",
  ]

  caveats <<~EOS
    Please run the following to setup your shell:
      conda init "$(basename "${SHELL}")"
  EOS
end
