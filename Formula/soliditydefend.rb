# Formula for Homebrew installation of SolidityDefend
class Soliditydefend < Formula
  desc "High-performance static analysis security tool for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityDefend"
  version "1.10.14"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.14/soliditydefend-v1.10.14-darwin-arm64.tar.gz"
      sha256 "4cf05f3f323518cd87fa840a0ffad714194f81d3ecec9c82c3cffc3982f739fc"
    end
    on_intel do
      url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.14/soliditydefend-v1.10.14-darwin-x86_64.tar.gz"
      sha256 "3e4415a02821a34700cd80778108c93478f2ebc06cb24e68a4f5e0b5857bd10a"
    end
  end

  on_linux do
    url "https://github.com/BlockSecOps/SolidityDefend/releases/download/v1.10.14/soliditydefend-v1.10.14-linux-amd64.tar.gz"
    sha256 "e76f3c90a8785e8e2f063987fbad3a2abbf9dddcf97193a06051dc4568c69f1e"
  end

  def install
    # Install the binary with platform-specific name
    if Hardware::CPU.arm? && OS.mac?
      bin.install "soliditydefend-darwin-arm64" => "soliditydefend"
    elsif Hardware::CPU.intel? && OS.mac?
      bin.install "soliditydefend-darwin-x86_64" => "soliditydefend"
    elsif OS.linux?
      bin.install "soliditydefend-linux-amd64" => "soliditydefend"
    end

    # Install shell completions if available
    if File.exist?("completions/soliditydefend.bash")
      bash_completion.install "completions/soliditydefend.bash"
    end
    if File.exist?("completions/soliditydefend.zsh")
      zsh_completion.install "completions/soliditydefend.zsh"
    end
    if File.exist?("completions/soliditydefend.fish")
      fish_completion.install "completions/soliditydefend.fish"
    end

    # Install man page if available
    if File.exist?("man/soliditydefend.1")
      man1.install "man/soliditydefend.1"
    end
  end

  test do
    # Test that the binary runs and shows version (outputs to stderr with exit 1)
    assert_match "soliditydefend 1.10.14", shell_output("#{bin}/soliditydefend --version 2>&1", 1)

    # Test help command (outputs to stderr with exit 1)
    assert_match "Usage:", shell_output("#{bin}/soliditydefend --help 2>&1", 1)

    # Test list-detectors command (exit 0)
    output = shell_output("#{bin}/soliditydefend --list-detectors 2>&1")
    assert_match "detector", output.downcase
  end
end
