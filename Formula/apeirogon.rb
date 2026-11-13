# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.43.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.43.0/apeirogon-v0.43.0-aarch64-apple-darwin.tar.gz"
    sha256 "19cc045c15439f698fd6810f650d6cce3f5d5ee662d6961cb2f50c2540104413"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.43.0/apeirogon-v0.43.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3be1f145f400cdb75a389a2540c903017c1922449ead1f8c86d8bf797f24de01"
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
