# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.29.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.29.0/apeirogon-v0.29.0-aarch64-apple-darwin.tar.gz"
    sha256 "a1a401c5fc17186c1e5b36b630274f40447c6243aa45232560869e571ccd04ca"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.29.0/apeirogon-v0.29.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3abc033df30048977e9cc528a65a30c3a083e6bfe8efa344cf4f8c56d1fadb66"
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
