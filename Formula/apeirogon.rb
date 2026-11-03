# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.9.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.9.0/apeirogon-v0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "1dd3a0656a0e021e762f030ac46b011bdca74b5b1cef0457addf6fdc76e0ec9e"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.9.0/apeirogon-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8bcaef01c95288850b14051c02bfe706606555d2e87dde4a4c81f9b225b51fa3"
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
