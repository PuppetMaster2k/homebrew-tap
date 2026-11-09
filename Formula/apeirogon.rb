# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.21.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.21.0/apeirogon-v0.21.0-aarch64-apple-darwin.tar.gz"
    sha256 "c3ce25731fe1395b84a1b1b5163868a98514202664e0f25d0145adb8eb990704"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.21.0/apeirogon-v0.21.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "248ec7bb9797b6c2058de6625ec015111cf49db14c6db6783ed359c65e79b7e0"
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
