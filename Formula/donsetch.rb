# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.0.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.0.0/donsetch-v3.0.0-darwin-x64.tar.gz"
      sha256 "__DARWIN_X64_SHA256__"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.0.0/donsetch-v3.0.0-darwin-arm64.tar.gz"
      sha256 "__DARWIN_ARM64_SHA256__"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.0.0/donsetch-v3.0.0-linux-x64.tar.gz"
      sha256 "__LINUX_X64_SHA256__"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.0.0/donsetch-v3.0.0-linux-arm64.tar.gz"
      sha256 "__LINUX_ARM64_SHA256__"
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
