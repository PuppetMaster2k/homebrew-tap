# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.44.1"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.1/apeirogon-v0.44.1-aarch64-apple-darwin.tar.gz"
    sha256 "346df78252ecb637570f972218dd754647ca4f4bee9e12f6e07016f2fb54d77a"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.1/apeirogon-v0.44.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b92647100f1227a4d4cf9c06bdb54a2f9cb50eb94fe20638e3b9f59c64fd6750"
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
