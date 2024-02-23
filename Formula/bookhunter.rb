class Bookhunter < Formula
  desc "Software to download chinese ebooks from Internet"
  homepage "https://github.com/bookstairs"
  version "0.14.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bookstairs/bookhunter/releases/download/v0.14.3/bookhunter_0.14.3_darwin_arm64.tar.gz"
      sha256 "6c4ff82754ca3fe444cc132f085f125f23ce09f87296afd5641f1953e4fd447d"

      def install
        bin.install "bookhunter"

        # Install shell completions
        output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "bash")
        (bash_completion/"bookhunter").write output

        output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "zsh")
        (zsh_completion/"_bookhunter").write output

        output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "fish")
        (fish_completion/"bookhunter.fish").write output
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bookstairs/bookhunter/releases/download/v0.14.3/bookhunter_0.14.3_darwin_amd64.tar.gz"
      sha256 "4b8218c6031a9ca74e582bae84b077f630842c66b086dc01a76bad0268a74d50"

      def install
        bin.install "bookhunter"

        # Install shell completions
        output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "bash")
        (bash_completion/"bookhunter").write output

        output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "zsh")
        (zsh_completion/"_bookhunter").write output

        output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "fish")
        (fish_completion/"bookhunter.fish").write output
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bookstairs/bookhunter/releases/download/v0.14.3/bookhunter_0.14.3_linux_amd64.tar.gz"
      sha256 "3c4074b4b4b83c5ec4429c04609a0b957b1542683977a2cf9cd84aff6c596a05"

      def install
        bin.install "bookhunter"

        # Install shell completions
        output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "bash")
        (bash_completion/"bookhunter").write output

        output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "zsh")
        (zsh_completion/"_bookhunter").write output

        output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "fish")
        (fish_completion/"bookhunter.fish").write output
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bookstairs/bookhunter/releases/download/v0.14.3/bookhunter_0.14.3_linux_arm64.tar.gz"
      sha256 "e12c66a776aa3d69d5bdde6c1a4c1c8e568fed9120a5bb57bf3bfafc92c7d095"

      def install
        bin.install "bookhunter"

        # Install shell completions
        output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "bash")
        (bash_completion/"bookhunter").write output

        output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "zsh")
        (zsh_completion/"_bookhunter").write output

        output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "fish")
        (fish_completion/"bookhunter.fish").write output
      end
    end
  end

  livecheck do
    url "https://github.com/bookstairs/bookhunter/releases"
    strategy :github_latest
  end

  test do
    system "#{bin}/bookhunter", "version"
  end
end
