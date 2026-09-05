# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases:
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents: stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.6.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.2/donsetch-darwin-x64.tar.gz"
      sha256 "afe96224603c2bcd836a5bbbc8467064e9b35a3fad94ddd4686f2ff987e4fcb1"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.2/donsetch-darwin-arm64.tar.gz"
      sha256 "fcf8c7a28c58f485e7167b4b30abe90c0232122df2770eb2883b32f98b6fb144"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.2/donsetch-linux-x64.tar.gz"
      sha256 "ba51fb4482e179bfde3efe1c9fdb20f30d612826c93d56d265e7dcbaae2d1a32"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.2/donsetch-linux-arm64.tar.gz"
      sha256 "cd2d7c820a19f870e145edfde8d7a25f4d1453d2af2c15413f68a4f7f93b1a64"
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