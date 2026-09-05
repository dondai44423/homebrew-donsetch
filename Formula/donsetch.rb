# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases:
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents: stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.6.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.2/donsetch-darwin-x64.tar.gz"
      sha256 "c15f41fffc6177d976d36fc7cd541af73f31a460d71d81813fad9c0f3b43df2b"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.2/donsetch-darwin-arm64.tar.gz"
      sha256 "1e4e3cd20d12927390912f34135c8ea9cc1d6366e9ee6682fcf424b9bbf400ea"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.2/donsetch-linux-x64.tar.gz"
      sha256 "fe3516b5b02cd2f3936ef9a424c5c24d66a1f80eb22a584f05bcdd58ec95ccec"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.2/donsetch-linux-arm64.tar.gz"
      sha256 "4bd37f86028cc8dcc26969e7692cd457a318bb83017752c4c4031e3fd6777ca6"
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