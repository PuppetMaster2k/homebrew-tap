# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.26.1"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.26.1/apeirogon-v0.26.1-aarch64-apple-darwin.tar.gz"
    sha256 "aedf42afbc790832f56d513e7dc31f5fcdc1c334437f10fe1e596443b496d2dd"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.26.1/apeirogon-v0.26.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6086052966fcddcdf47582edd63aca83192979f1a9826f81f2bb0b608c2e9e17"
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
