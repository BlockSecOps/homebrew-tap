class Soliditydefend < Formula
  desc "High-performance static analysis security tool for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityDefend"
  version "1.10.5"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.5/soliditydefend-v1.10.5-darwin-arm64.tar.gz"
      sha256 "07e458f4268cc8aec7c95a6a9e6a68c2b0a5927f5e8fcc6e8e0c04ec6574fe98"
    else
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.5/soliditydefend-v1.10.5-darwin-x86_64.tar.gz"
      sha256 "1808f1fbeb0e9dc8b67529f294f30a85fe12eeda84e50b1f8ce9ef9644a42537"
    end
  end

  on_linux do
    url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.5/soliditydefend-v1.10.5-linux-x86_64.tar.gz"
    sha256 "REPLACE_WITH_ACTUAL_SHA256_LINUX"
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
