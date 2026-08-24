# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.2.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.1/donsetch-darwin-x64.tar.gz"
      sha256 "27fe6b729e7c1157fa9f473bdf1e2f28dd4019e2fa200ee3227ce8dad710f984"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.1/donsetch-darwin-arm64.tar.gz"
      sha256 "930c6d3ea71d1c261ab79f4d6d8ef879606bc7c7e3b90777662cb172707c4e38"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.1/donsetch-linux-x64.tar.gz"
      sha256 "d6de26015602da16afa7f5686ef4c00f39282ce8fedf638cf291f0e4d6afab64"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.1/donsetch-linux-arm64.tar.gz"
      sha256 "3a6a4c5d56ac822926f8c75573b88d5957126d29b4f0cc1bee93f951381e73ca"
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
