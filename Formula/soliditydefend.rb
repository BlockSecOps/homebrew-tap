class Soliditydefend < Formula
  desc "High-performance static analysis security tool for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityDefend"
  url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.0/soliditydefend-v1.10.0-x86_64-apple-darwin.tar.gz"
  version "1.10.0"
  sha256 "5fc5be8f9a0bfbb4733401162290688939b70d48514dabc61454696a5b57b12f"
  license "MIT OR Apache-2.0"

  def install
    bin.install "soliditydefend"
  end

  test do
    # Test that the binary runs and shows version
    assert_match version.to_s, shell_output("#{bin}/soliditydefend --version")

    # Test help command
    assert_match "USAGE", shell_output("#{bin}/soliditydefend --help")

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
