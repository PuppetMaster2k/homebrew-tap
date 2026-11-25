# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.44.5"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.5/apeirogon-v0.44.5-aarch64-apple-darwin.tar.gz"
    sha256 "4068b5e0b158c920bafb0cec49adf8b252c45e3c53a3394a2dc44d89c66a0388"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.5/apeirogon-v0.44.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3688a00f7d7e2e0df9d75f5a5a325abfafd5d2fc15546be2e017f349d5888aa4"
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
