cask "miniforge-cn" do
  os macos: "MacOSX", linux: "Linux"

  version "26.5.3-0"
  sha256 arm:          "0d765919d3ccfd1f89147aa1cf8133bfc55b3a3c13f5bacdcc091c33132fddd2",
         intel:        "0266a7bfeb12165286133145717bef0d88070f1b76710beb6a62fec4e88371a1",
         arm64_linux:  "0391e42075a7632e9665d6e728387ee6b905f6c3e704d3513e1c1133d0d69b89",
         x86_64_linux: "14db468222ad564658656f769506056209b6dc375f5e7dfd31eb5ebbf08fa529"

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
