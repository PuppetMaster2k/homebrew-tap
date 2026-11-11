# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.26.3"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.26.3/apeirogon-v0.26.3-aarch64-apple-darwin.tar.gz"
    sha256 "9ff4f214dcc74eac36c1a62fec256881320d077dc864b3704fd5a4debbea4e83"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.26.3/apeirogon-v0.26.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f0cca53d56b9ddf530d7bf095b274c52ae386090cfbf8b607832ceec83d25395"
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
