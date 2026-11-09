# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.20.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.20.0/apeirogon-v0.20.0-aarch64-apple-darwin.tar.gz"
    sha256 "c509c3c7d577d81bfa6d05950481dcc3bc73e3fa2353ec80c46f495f101256f8"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.20.0/apeirogon-v0.20.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ed659554a7156719a6699185f6633a13fd971e69f51e9cbcc01da0091e7a987e"
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
