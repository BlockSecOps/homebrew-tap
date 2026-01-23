class Soliditydefend < Formula
  desc "High-performance static analysis security tool for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityDefend"
  version "1.10.7"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.7/soliditydefend-v1.10.7-darwin-arm64.tar.gz"
      sha256 "30876e6be80a51d38f32557a7e80ace929f3c9db9089105e149d5c0e833339ba"
    else
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.7/soliditydefend-v1.10.7-darwin-x86_64.tar.gz"
      sha256 "e0fd574828ee32a62db24530ee029202c4c1e6499ff999afae6bc30b07c64982"
    end
  end

  on_linux do
    url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.7/soliditydefend-v1.10.7-linux-x86_64.tar.gz"
    sha256 "a1e37a73607185231700862371c0d3d7184116fc8a6840e30d04a2fe0b81ed1e"
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
