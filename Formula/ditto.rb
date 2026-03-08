class Ditto < Formula
  desc "A dotfile manager that transforms your dev environment"
  homepage "https://github.com/pattynextdoor/ditto"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pattynextdoor/ditto/releases/download/v#{version}/ditto-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/pattynextdoor/ditto/releases/download/v#{version}/ditto-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "ditto"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ditto --version")
  end
end
