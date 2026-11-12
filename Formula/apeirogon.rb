# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.38.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.38.0/apeirogon-v0.38.0-aarch64-apple-darwin.tar.gz"
    sha256 "64f9a0c3a1fa47da03497c7c279d39754ee9b48c2351be962860492de43dd864"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.38.0/apeirogon-v0.38.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7d94102b84cbfd495dae9748e54839b6fec5dc21012a45f9bf4d58e1fa7263d9"
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
