# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.43.1"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.43.1/apeirogon-v0.43.1-aarch64-apple-darwin.tar.gz"
    sha256 "f8aceae217ee99e054c1e7e1bfdf5d064f9d3544c322e1b9809cc5ced3625d42"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.43.1/apeirogon-v0.43.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "674861188a9faeee90475446fe201e5b38b487f59716c0bdd6f8fdec0e54b3b5"
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
