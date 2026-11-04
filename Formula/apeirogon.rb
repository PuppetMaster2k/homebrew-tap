# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.15.2"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.15.2/apeirogon-v0.15.2-aarch64-apple-darwin.tar.gz"
    sha256 "33dc478482392144733a13a45215a357c2e53367166bb4accff352391c9e932d"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.15.2/apeirogon-v0.15.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "eec83ff090a0b531bfa5a72b3e2aa76aabe43c78772436820ed15a3e2d5c484d"
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
