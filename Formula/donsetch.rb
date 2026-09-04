# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases:
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents: stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.6.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.2/donsetch-darwin-x64.tar.gz"
      sha256 "ea45204f188374bf8fa9abe9b6b16d9e6ce3dedd537bb15fb907367bda87715a"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.2/donsetch-darwin-arm64.tar.gz"
      sha256 "bdd8b429f167c11d6cdef41ebe16dd4c55f78b129e6b9aaa77f4e60ff020097c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.2/donsetch-linux-x64.tar.gz"
      sha256 "781302f4170629cd6a338038904455defd21f3c9b9a01b2d665976ebce53974e"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.2/donsetch-linux-arm64.tar.gz"
      sha256 "012987a14467c8d96eb25df39a2d2ce70259428c31c89eef399c75e9d4b32490"
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