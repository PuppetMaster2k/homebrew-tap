# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.10.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.10.0/apeirogon-v0.10.0-aarch64-apple-darwin.tar.gz"
    sha256 "cb11153674431aee0011d72ffb73dcb7f2a3186fd5db4736a089d52673811599"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.10.0/apeirogon-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "127b8e26a59f9a960cd5bef945e2fe886ebafed9e874dcba70859ce219977d6d"
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
