# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.4.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.1/donsetch-darwin-x64.tar.gz"
      sha256 "17964ce9a4c4333a1d3163185105927e79dcab2125e0bfb4c60ca05704abbc53"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.1/donsetch-darwin-arm64.tar.gz"
      sha256 "287c62b46bfc3165c35e9e244e40d32d7e4fcc5837a4e7abaa112334b9c23cdd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.1/donsetch-linux-x64.tar.gz"
      sha256 "b2e37f5af2875df4f660821e16359bae29c6bf544aaaef4a093302381d25ed40"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.1/donsetch-linux-arm64.tar.gz"
      sha256 "7c8d993f2a0cc5d9d5c72dbbe550eed59319e5f045eba560e177c5d4d0c9dd3d"
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
