# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.40.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.40.0/apeirogon-v0.40.0-aarch64-apple-darwin.tar.gz"
    sha256 "319fdaf3676ef3c8a86c54d59f1752de48863a319d3ab25b8eb2e8e5ea29b0ec"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.40.0/apeirogon-v0.40.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bef305911d9dad89fbb7aef17a2864284dd989787c6fe17b3eecc9665a623d72"
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
