# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.35.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.35.0/apeirogon-v0.35.0-aarch64-apple-darwin.tar.gz"
    sha256 "f5f02780cda61ef34e9fe84b3b5692e827ad0a97ba8c6d5715fe58e3ec2f6f9e"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.35.0/apeirogon-v0.35.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "de6eb6185d430ccc286af733532d9eb8922bd709f2c1e05aaced4d69af2a74fd"
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
