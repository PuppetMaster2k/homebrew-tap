# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.22.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.22.0/apeirogon-v0.22.0-aarch64-apple-darwin.tar.gz"
    sha256 "8e9e5c9f37bf931a2ebf8d2a4fb50ab3d2d47ca6e804611d066e6db07ad9d822"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.22.0/apeirogon-v0.22.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f6813c5aab7d89d4279dd1c326a696e2b2dde109208bc21a96e2bad0d8ac59fa"
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
