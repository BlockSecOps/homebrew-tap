class Soliditydefend < Formula
  desc "High-performance static analysis security tool for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityDefend"
  version "1.10.11"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.11/soliditydefend-v1.10.11-darwin-arm64.tar.gz"
      sha256 "5abf471a61f84b57332b01a49a17cefa809725afabf42f1d773c4fcc1931d6d1"
    else
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.11/soliditydefend-v1.10.11-darwin-x86_64.tar.gz"
      sha256 "70069dfaa78bb5e7d86584bdf19a79b5f1420400721556b09d73474547c61bb4"
    end
  end

  on_linux do
    url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.11/soliditydefend-v1.10.11-linux-x86_64.tar.gz"
    sha256 "6ba5f891e42b963639c885e4d5fe7b7290374386556c4846a8c3bb9aacb9dccb"
  end

  def install
    bin.install "soliditydefend"
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
