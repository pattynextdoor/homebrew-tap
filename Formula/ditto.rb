class Ditto < Formula
  desc "A dotfile manager that transforms your dev environment"
  homepage "https://github.com/pattynextdoor/ditto"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pattynextdoor/ditto/releases/download/v0.1.0/ditto-aarch64-apple-darwin.tar.gz"
      sha256 "443fba9306631a174d05bf6fec91f14c5b98eb558a55c10c8f683c03815011e6"
    else
      url "https://github.com/pattynextdoor/ditto/releases/download/v0.1.0/ditto-x86_64-apple-darwin.tar.gz"
      sha256 "89f83b29c5eb2603ab6fd8a5a0436f0c2839c86fba40de19d4cc710a01523923"
    end
  end

  def install
    bin.install "ditto"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ditto --version")
  end
end
