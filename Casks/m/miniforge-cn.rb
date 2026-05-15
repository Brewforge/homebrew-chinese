cask "miniforge-cn" do
  os macos: "MacOSX", linux: "Linux"

  version "26.3.2-2"
  sha256 arm:          "2657d94152343cff7c06159ac9fc09624d7879fa9575c5a0a324c571c4df0ade",
         intel:        "a755192103de19bb2782685ac78820c2e00702e5f33e6e4f0a3bf3c214f45d69",
         arm64_linux:  "f4096a92482b30f04534cddb63d8bc929118318deffac71d90fb89dc52359d22",
         x86_64_linux: "42260ffe3830fb953d5eee1bbb32229ff06aa7c3833c1ed7a9a0420a95685d94"

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
