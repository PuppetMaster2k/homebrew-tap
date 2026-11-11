# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.30.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.30.0/apeirogon-v0.30.0-aarch64-apple-darwin.tar.gz"
    sha256 "caa8625ecf94644d8c2d651258b15fb5201a429a694aae102a9878cf9b228c68"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.30.0/apeirogon-v0.30.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "416430c88a4c51297724556e5dd7d90b58d80d67c63a24bbd63f3b490fbfc9f1"
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
