# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.36.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.36.0/apeirogon-v0.36.0-aarch64-apple-darwin.tar.gz"
    sha256 "c9559f6596f3788ed9f12e59848e75a2183a1c214c2047dfd8cb18283c0afcbf"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.36.0/apeirogon-v0.36.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ffdbdaf4350d88982cda46568643edd335590951aaf7f2141fc501a6544e6d65"
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
