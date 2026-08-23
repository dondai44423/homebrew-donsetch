# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.2.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.0/donsetch-darwin-x64.tar.gz"
      sha256 "534e6c8c34b96d526873b033d33c64b264ef52d3ddc0e2acd64df87d00886364"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.0/donsetch-darwin-arm64.tar.gz"
      sha256 "a380e4357103cdaf1a860c9c058d946bcc7ec63634d253453af34405de6d56f5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.0/donsetch-linux-x64.tar.gz"
      sha256 "20572f45836e4edf45b5a5495f581dc815bac6719a16f2e27b62f0022c4bb2fb"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.0/donsetch-linux-arm64.tar.gz"
      sha256 "8c55161a7ba931fd63df0a818fc52c3ff6d01fc7d7a356faf9a541ad8e1304be"
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
