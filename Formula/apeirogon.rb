# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.24.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.24.0/apeirogon-v0.24.0-aarch64-apple-darwin.tar.gz"
    sha256 "cf89b1fc595f79c60e2735f112a74081bc7c5324ee3a363c290766482a5ea8bd"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.24.0/apeirogon-v0.24.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "06cefc803919f8b68247d4b98e33974b11d808be6b5052c19e64087fc25117a1"
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
