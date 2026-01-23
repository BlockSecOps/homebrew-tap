class Soliditydefend < Formula
  desc "High-performance static analysis security tool for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityDefend"
  version "1.10.8"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.8/soliditydefend-v1.10.8-darwin-arm64.tar.gz"
      sha256 "e4fc0a3a7ab9d26ec1eba28cc6d60b923e42a745046dacdc5866406e0f797985"
    else
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.8/soliditydefend-v1.10.8-darwin-x86_64.tar.gz"
      sha256 "fa999a1190b7322331e64bda063f8ef07ff6b0844861100a40dabebff58454cb"
    end
  end

  on_linux do
    url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.8/soliditydefend-v1.10.8-linux-x86_64.tar.gz"
    sha256 "16d6c1ebb8df9614748ce6ba3e9c1e751c89e1a6dca1e537e1f0c64100574bd5"
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
