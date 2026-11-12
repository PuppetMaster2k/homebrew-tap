# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.34.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.34.0/apeirogon-v0.34.0-aarch64-apple-darwin.tar.gz"
    sha256 "f29b73423d0627025d6284223b835718c3625a16e5589f31fd2a3d590c338c03"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.34.0/apeirogon-v0.34.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "23f256d35a4c7400b749f181e7fe60241b5a654a4200170204a48000cb38ec1c"
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
