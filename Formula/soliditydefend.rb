# Formula for Homebrew installation of SolidityDefend
class Soliditydefend < Formula
  desc "High-performance static analysis security tool for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityDefend"
  version "1.10.18"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.18/soliditydefend-v1.10.18-macos-aarch64.tar.gz"
      sha256 "54c01b35ef0acda2e2ab86c198df54c89e5d32362b0ea492f5ffe3498ea5f378"
    end
    on_intel do
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.18/soliditydefend-v1.10.18-macos-x86_64.tar.gz"
      sha256 "dc62b1ce8711fb30716bd7f5baaf51a542073cdcf680ac6629c696f921647f5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.18/soliditydefend-v1.10.18-linux-aarch64.tar.gz"
      sha256 "df3226eaa645148c2da4dce177327eb058a5b845a4b801699ee009dba0c69482"
    end
    on_intel do
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.18/soliditydefend-v1.10.18-linux-x86_64.tar.gz"
      sha256 "f90e054b2d3ac5a01ad1d3977353dbf634f2bf1f9fd69e75438883716d81ddeb"
    end
  end

  def install
    bin.install "soliditydefend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/soliditydefend --version 2>&1", 1)
    output = shell_output("#{bin}/soliditydefend --list-detectors 2>&1")
    assert_match "detector", output.downcase
  end
end
