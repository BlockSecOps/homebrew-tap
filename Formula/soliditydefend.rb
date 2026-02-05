class Soliditydefend < Formula
  desc "High-performance static analysis security tool for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityDefend"
  version "1.10.14"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.14/soliditydefend-v1.10.14-darwin-arm64.tar.gz"
      sha256 "4cf05f3f323518cd87fa840a0ffad714194f81d3ecec9c82c3cffc3982f739fc"
    else
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.14/soliditydefend-v1.10.14-darwin-x86_64.tar.gz"
      sha256 "3e4415a02821a34700cd80778108c93478f2ebc06cb24e68a4f5e0b5857bd10a"
    end
  end

  on_linux do
    url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.14/soliditydefend-v1.10.14-linux-amd64.tar.gz"
    sha256 "e76f3c90a8785e8e2f063987fbad3a2abbf9dddcf97193a06051dc4568c69f1e"
  end

  def install
    bin.install "soliditydefend-darwin-arm64" => "soliditydefend" if Hardware::CPU.arm? && OS.mac?
    bin.install "soliditydefend-darwin-x86_64" => "soliditydefend" if Hardware::CPU.intel? && OS.mac?
    bin.install "soliditydefend-linux-amd64" => "soliditydefend" if OS.linux?
  end

  test do
    # Test that the binary runs and shows version
    assert_match version.to_s, shell_output("#{bin}/soliditydefend --version 2>&1", 1)

    # Test help command
    assert_match "Usage", shell_output("#{bin}/soliditydefend --help 2>&1", 1)

    # Create a simple test contract
    (testpath/"test.sol").write <<~EOS
      // SPDX-License-Identifier: MIT
      pragma solidity ^0.8.0;
      contract Test {
        function test() public {}
      }
    EOS

    # Run analysis on test contract
    system bin/"soliditydefend", testpath/"test.sol"
  end
end
