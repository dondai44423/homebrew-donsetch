# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases:
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents: stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.6.6"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.6/donsetch-darwin-x64.tar.gz"
      sha256 "6aa0042040ab40a2a4a9f4ffe5596dacc85adb162493f4269cd097007a32cdad"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.6/donsetch-darwin-arm64.tar.gz"
      sha256 "562845831e513f6726267ac2e37175c6004570b7eec24939ccc490866af32b5f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.6/donsetch-linux-x64.tar.gz"
      sha256 "c9aa4272325c0ba69e5c11191585667cb1f032b9859d9af0e9b9231cc4de977b"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.6/donsetch-linux-arm64.tar.gz"
      sha256 "c9533324ece10e293c7785aa60896b9b5dcf6eeba05fafd18d708b8bc06ca894"
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