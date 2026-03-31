class Toph < Formula
  desc "btop for AI agents — terminal dashboard for monitoring AI coding agents"
  homepage "https://github.com/pattynextdoor/toph"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pattynextdoor/toph/releases/download/v#{version}/toph_#{version}_darwin_arm64.tar.gz"
      sha256 "c706b5493ab7c73ad221975caa10eb338b20afc768b4586ac7460fc83fefcbec"
    else
      url "https://github.com/pattynextdoor/toph/releases/download/v#{version}/toph_#{version}_darwin_amd64.tar.gz"
      sha256 "a22a1b4d69be0472a8a4a4bb90950fa45d7f6b4edef69b73b3fa3ca6ffcd36ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pattynextdoor/toph/releases/download/v#{version}/toph_#{version}_linux_arm64.tar.gz"
      sha256 "3499b24a4bbdd58bf1bd3de5f2ab4fce165d6d927035cbfb7f70e75c5a2d8540"
    else
      url "https://github.com/pattynextdoor/toph/releases/download/v#{version}/toph_#{version}_linux_amd64.tar.gz"
      sha256 "7820544d3782dd66cbb8a71830ac48b9c699007fbb6fbff12589dea89d414c58"
    end
  end

  def install
    bin.install "toph"
  end

  test do
    assert_match "toph", shell_output("#{bin}/toph --version")
  end
end
