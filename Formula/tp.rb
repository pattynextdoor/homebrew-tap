class Tp < Formula
  desc "Teleport anywhere in your codebase — AI-enhanced, project-aware directory navigation"
  homepage "https://github.com/pattynextdoor/tp"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pattynextdoor/tp/releases/download/v#{version}/tp-macos-aarch64.tar.gz"
      # sha256 will be filled after first release
    else
      url "https://github.com/pattynextdoor/tp/releases/download/v#{version}/tp-macos-x86_64.tar.gz"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pattynextdoor/tp/releases/download/v#{version}/tp-linux-aarch64.tar.gz"
    else
      url "https://github.com/pattynextdoor/tp/releases/download/v#{version}/tp-linux-x86_64.tar.gz"
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
