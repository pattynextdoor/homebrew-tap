class Tp < Formula
  desc "Teleport anywhere in your codebase — AI-enhanced, project-aware directory navigation"
  homepage "https://github.com/pattynextdoor/tp"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pattynextdoor/tp/releases/download/v#{version}/tp-macos-aarch64.tar.gz"
      sha256 "b61c18f5df4959834729c675c6797e18451ccc91e0d18a5fd2d3026244e528e5"
    else
      url "https://github.com/pattynextdoor/tp/releases/download/v#{version}/tp-macos-x86_64.tar.gz"
      sha256 "41074d8277faf928bf7bd353c012d7990892c205a69f9aea12822075d208521d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pattynextdoor/tp/releases/download/v#{version}/tp-linux-aarch64.tar.gz"
      sha256 "96ce5c9d9443a8a1bee5568ed0c049b72ac3bdd14530bf02186270bf21b6696d"
    else
      url "https://github.com/pattynextdoor/tp/releases/download/v#{version}/tp-linux-x86_64.tar.gz"
      sha256 "39a5dcbf9c6ef4242d0f11544ceaec3c70630b4345aa37d64c46147986100e34"
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
