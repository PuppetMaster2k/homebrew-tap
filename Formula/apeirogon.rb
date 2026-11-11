# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.31.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.31.0/apeirogon-v0.31.0-aarch64-apple-darwin.tar.gz"
    sha256 "f11f4056bf75f7bf763d1d4fe274c89b6d91ac32530a53b8dfd7433a9360aced"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.31.0/apeirogon-v0.31.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ce32515d670cdfb099e0aa88596b8498929be3e6ac7f8ccdee0b313a9282b59c"
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
