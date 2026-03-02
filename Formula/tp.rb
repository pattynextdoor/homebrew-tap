class Tp < Formula
  desc "Teleport anywhere in your codebase — AI-enhanced, project-aware directory navigation"
  homepage "https://github.com/pattynextdoor/tp"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pattynextdoor/tp/releases/download/v#{version}/tp-macos-aarch64.tar.gz"
      sha256 "77e709269f4c1b30da2f4051dea070ecde895768c143bd9b75c9867167991899"
    else
      url "https://github.com/pattynextdoor/tp/releases/download/v#{version}/tp-macos-x86_64.tar.gz"
      sha256 "38b76f21d82e593da888952fad0448d377b7c7da12570a041a6615a6cf66b597"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pattynextdoor/tp/releases/download/v#{version}/tp-linux-aarch64.tar.gz"
      sha256 "dca412145e7b764caf603ffb01c3de9ddfb9c5b427f30cc8e845130a2f5fe33c"
    else
      url "https://github.com/pattynextdoor/tp/releases/download/v#{version}/tp-linux-x86_64.tar.gz"
      sha256 "46fee2723354319682f2692efa7c25d6d5fbc114ed346d611d359da6d9834ce0"
    end
  end

  def install
    bin.install "tp"
  end

  def caveats
    <<~EOS
      Add this to your shell config:

        # bash (~/.bashrc)
        eval "$(tp init bash)"

        # zsh (~/.zshrc)
        eval "$(tp init zsh)"

        # fish (~/.config/fish/config.fish)
        tp init fish | source
    EOS
  end

  test do
    assert_match "tp", shell_output("#{bin}/tp --version")
  end
end
