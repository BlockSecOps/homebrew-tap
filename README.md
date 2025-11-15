# BlockSecOps Homebrew Tap

This is the official Homebrew tap for BlockSecOps security tools.

## Installation

```bash
# Add the tap
brew tap BlockSecOps/tap

# Install SolidityDefend
brew install soliditydefend

# Verify installation
soliditydefend --version
```

## Usage

```bash
# Analyze a contract
soliditydefend contract.sol

# Show all 204 detectors
soliditydefend --list-detectors

# Filter by severity
soliditydefend --severity critical,high contracts/
```

## Update

```bash
# Update to latest version
brew upgrade soliditydefend
```

## Uninstall

```bash
brew uninstall soliditydefend
brew untap BlockSecOps/tap
```

## Available Packages

### soliditydefend (Public)

- **soliditydefend** (v1.3.2) - 204 security detectors for Solidity smart contracts
  - Account Abstraction (ERC-4337) vulnerability detection
  - Flash loan security analysis
  - DeFi protocol security checks
  - Oracle manipulation detection
  - And 200+ more detectors

### solidity-sbom (Private Repository)

- **solidity-sbom** (v0.9.2) - SBOM generator for Solidity smart contracts
  - CycloneDX 1.5 and SPDX 2.3 SBOM generation
  - Hardhat and Foundry project support
  - Dependency graph visualization
  - SBOM diff for supply chain monitoring
  - Deployment tracking across networks

**Installation:** Since the SolidityBOM repository is private, install using cargo:

```bash
# Clone the repository (requires authentication)
cd /path/to/SolidityBOM/solidity-sbom

# Install using cargo
cargo install --path . --locked

# Verify installation
solidity-sbom --version

# Setup shell completions
solidity-sbom completions bash > ~/.local/share/bash-completion/completions/solidity-sbom
solidity-sbom completions zsh > ~/.zfunc/_solidity-sbom
solidity-sbom completions fish > ~/.config/fish/completions/solidity-sbom.fish
```

**Updating:**

```bash
cd /path/to/SolidityBOM/solidity-sbom
git pull
cargo install --path . --locked --force
```

## Requirements

- macOS or Linux
- Rust toolchain (automatically installed via Homebrew)

## Links

- **Main Repository**: https://github.com/BlockSecOps/SolidityDefend
- **Documentation**: https://github.com/BlockSecOps/SolidityDefend/tree/main/docs
- **Issues**: https://github.com/BlockSecOps/SolidityDefend/issues
- **Releases**: https://github.com/BlockSecOps/SolidityDefend/releases

## License

MIT OR Apache-2.0
