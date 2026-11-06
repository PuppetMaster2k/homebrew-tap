# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.16.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.16.0/apeirogon-v0.16.0-aarch64-apple-darwin.tar.gz"
    sha256 "d5c0548069d8d7f86d69fc932366697d741c8ffcacc727ff150c25de7e3bb127"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.16.0/apeirogon-v0.16.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "db57948ee50e12d9561e6a9820a268e0914c6b891b5f38dd581f1d4f1cad6dc3"
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
