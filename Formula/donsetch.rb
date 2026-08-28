# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.4.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.0/donsetch-darwin-x64.tar.gz"
      sha256 "dfbaa55a583d11c80df9d043aa0e94e6e61ba80d420f5aa80b717a03c1a46657"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.0/donsetch-darwin-arm64.tar.gz"
      sha256 "48e2e1d05423f499a81f9143264ff30e42bb1130beac28a413362b7bd9df13ef"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.0/donsetch-linux-x64.tar.gz"
      sha256 "9f949c9676420f22882d394c0f4576067db21beb020692ca948437b91a9d29f0"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.0/donsetch-linux-arm64.tar.gz"
      sha256 "3e559b013e3958b4e8417badef43a2672f570643504801dd0e8cf238c7c91474"
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
