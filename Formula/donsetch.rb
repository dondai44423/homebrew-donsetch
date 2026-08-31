# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.4.4"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.4/donsetch-darwin-x64.tar.gz"
      sha256 "2e11df5fd1a6f7ea4aadfe73e8ca2ab6656790870904a8071854984076bf4f0f"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.4/donsetch-darwin-arm64.tar.gz"
      sha256 "7edb92ef3d686b2e2fac3c6925e61117edf71cfa5413b0be55afacfeee49f49f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.4/donsetch-linux-x64.tar.gz"
      sha256 "d31e2e75a791332c4c7273f1acfa6bb9cb9585bb6f950c91ed621ae04d735d35"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.4/donsetch-linux-arm64.tar.gz"
      sha256 "fc705ceb9caa501d723d23ff41221395c7afe3cb47f06668fc3cca23957ea79d"
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
