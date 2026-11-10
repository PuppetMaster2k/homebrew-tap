# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.23.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.23.0/apeirogon-v0.23.0-aarch64-apple-darwin.tar.gz"
    sha256 "c2d0c8eec607f0bd3250a498a931096c921cd301646107a78ed2ac0c7c7e2bcb"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.23.0/apeirogon-v0.23.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6ec91d2ff92efc1bbe938f1e5dd3c603bfd05bf82c23d8c2aef4d1624429332c"
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
