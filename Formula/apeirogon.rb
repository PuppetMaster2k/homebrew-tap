# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.30.1"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.30.1/apeirogon-v0.30.1-aarch64-apple-darwin.tar.gz"
    sha256 "1b87eb489a4ab844b5f4b5639097f6aad2c854a01be664a04d6185cd82e83224"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.30.1/apeirogon-v0.30.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7f88a4588220a87de6bd80cebeec81d90eeea18db9aeb4ceb0d05564320b4ca6"
  end

  def install
    bin.install "apeirogond", "a7n", "a7n-gui"
  end

  def caveats
    return unless OS.mac?

    <<~EOS
      Releases are unsigned. Grant Accessibility and Input Monitoring
      permissions again after every update.
    EOS
  end

  test do
    system "#{bin}/a7n", "--version"
  end
end
