# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases:
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents: stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.6.4"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.4/donsetch-darwin-x64.tar.gz"
      sha256 "bbded8f4941623b94a5cc065762b57543d62d288e0d7696984a0e9411c9f4a81"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.4/donsetch-darwin-arm64.tar.gz"
      sha256 "1652582f27ddcbe053fa204b1a2c2c60b3ecbf9e870eddca317ccc4eb54773e4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.4/donsetch-linux-x64.tar.gz"
      sha256 "d55ae035828bcfbeb6b2e8c2456103478d44e26b332d85b3408e3cad8b37d3c6"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.4/donsetch-linux-arm64.tar.gz"
      sha256 "4c88c42c35f83f2e9fae57f6fe9db36028635f7a1436112fc3c69b4651f1c0e1"
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