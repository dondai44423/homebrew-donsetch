# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.2.3"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.3/donsetch-darwin-x64.tar.gz"
      sha256 "435d80e6da9c2694d4ccec8e0827a7e85254b6edcdca38b785340307b34a64b2"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.3/donsetch-darwin-arm64.tar.gz"
      sha256 "db789e1eeff78caf4f95f9ad3f9b1b022b35c491b49d567dbe79974339e7ee03"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.3/donsetch-linux-x64.tar.gz"
      sha256 "a98a9e7bdd32d072ce4637eb4104f539d7df7d52aa583126b1faf94dfb1e55a4"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.3/donsetch-linux-arm64.tar.gz"
      sha256 "958c2e9cec861304ace475a8bd6e10fc4fef6e3e39625ab3fe3144f2047b3a70"
    end
  end

  def install
    bin.install "donsetch"
  end

  def caveats
    <<~EOS
      DonSeTch is an MCP server: connect from your MCP client via
        donsetch mcp
      Run `donsetch doctor` to verify the install.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/donsetch --version")
  end
end
