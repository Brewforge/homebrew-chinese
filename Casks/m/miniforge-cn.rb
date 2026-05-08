cask "miniforge-cn" do
  os macos: "MacOSX", linux: "Linux"

  version "26.3.2-0"
  sha256 arm:          "a58d9e5a30cac3cd5ecdba2dc52dd042584a2f742a47e975779530f89e5768f5",
         intel:        "f19cc973899925b29141239880787e26cd524bcecd259c2fee72e0f561fc7b54",
         arm64_linux:  "b8f0320c0fe9bc9dd24be8896ecf4995bbba4227c9822902daeeb7f3689ba7d3",
         x86_64_linux: "1d9b75bdf29ba48d9f10bb155a685baab02d318d1d591d2495f97524579dccc1"

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
