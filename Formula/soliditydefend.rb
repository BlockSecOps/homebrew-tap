class Soliditydefend < Formula
  desc "High-performance static analysis security tool for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityDefend"
  url "https://github.com/BlockSecOps/SolidityDefend/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "e64f393e5d8b88d2e480fde950a6b3fb0204aa878fdd5fa82987adf85cd03421"
  license "MIT OR Apache-2.0"
  head "https://github.com/BlockSecOps/SolidityDefend.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/soliditydefend")
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
