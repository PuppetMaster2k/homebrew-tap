# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.25.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.25.0/apeirogon-v0.25.0-aarch64-apple-darwin.tar.gz"
    sha256 "78cfd56b7fe2666a4f86bf9f91f92cc92c35888e843bdbb8470e0cb87df65c93"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.25.0/apeirogon-v0.25.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "558df03b1069714866d24ddff721498c0e6596ab263d905610ce346e6815af3d"
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
