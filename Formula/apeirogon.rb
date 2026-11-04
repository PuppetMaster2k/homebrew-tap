# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.15.4"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.15.4/apeirogon-v0.15.4-aarch64-apple-darwin.tar.gz"
    sha256 "256a794d72ccd262cd4f437dedb89bef44241e4efb814c979285b9c277783261"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.15.4/apeirogon-v0.15.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a165b3d13dde7098e5a0978a0b27cf037abaaf73a6a4d3e5596482aa556f231c"
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
