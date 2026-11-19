# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.44.4"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.4/apeirogon-v0.44.4-aarch64-apple-darwin.tar.gz"
    sha256 "578b27d1463b4b4e5bc971c640300d4da84545b42d78d9196e9ddebcc9b2904d"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.4/apeirogon-v0.44.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e4d7da7b25b072a36c5f087e4386796a086343793e7ef8f5ab126c4ffd1c140f"
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
