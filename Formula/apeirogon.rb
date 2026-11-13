# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.43.3"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.43.3/apeirogon-v0.43.3-aarch64-apple-darwin.tar.gz"
    sha256 "a606fc68681849ba542e7188f437b7fb5c335069afa7ce98676c3d5d5363d8af"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.43.3/apeirogon-v0.43.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d815acb865fef54a416ee08965f564e0f661586b6be2369f3756d6438b838364"
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
