# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.28.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.28.0/apeirogon-v0.28.0-aarch64-apple-darwin.tar.gz"
    sha256 "c41a7d65175e0407a28af95dda1236bf58899fadb5a62189be586728e46fbfc0"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.28.0/apeirogon-v0.28.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "da7644a6b36cb8eca0686f358b6c61a8bc92fdb1363eb3546e85809c39f9103d"
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
