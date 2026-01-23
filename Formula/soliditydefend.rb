class Soliditydefend < Formula
  desc "High-performance static analysis security tool for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityDefend"
  version "1.10.6"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.6/soliditydefend-v1.10.6-darwin-arm64.tar.gz"
      sha256 "f8b2f5c101972c2fcbf54df2b7bb89c6ffdc6981047827b5a6c8998343f1d401"
    else
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.6/soliditydefend-v1.10.6-darwin-x86_64.tar.gz"
      sha256 "568b92d1837a4e82ca869350653ccaf0515849e32786eade1005a7d3b5f0669d"
    end
  end

  on_linux do
    url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.6/soliditydefend-v1.10.6-linux-x86_64.tar.gz"
    sha256 "895259365f8c7a16b0c6944ba0e9bb447d8cbd1e0c95ed9a7c5fa2085fc48c5f"
  end

  def install
    bin.install "soliditydefend"
  end

  test do
    # Test that the binary runs and shows version
    assert_match version.to_s, shell_output("#{bin}/soliditydefend --version", 1)

    # Test help command
    assert_match "USAGE", shell_output("#{bin}/soliditydefend --help", 1)

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
