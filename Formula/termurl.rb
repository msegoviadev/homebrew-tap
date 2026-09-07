class Termurl < Formula
  desc "Terminal client for Hurl collections with an agent-friendly headless CLI"
  homepage "https://github.com/msegoviadev/termurl"
  version "0.3.0"
  license "MIT"
  depends_on "hurl"

  on_macos do
    on_arm do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.3.0/termurl-darwin-arm64"
      sha256 "b2e8597356d7c47bbc11ddccb7ca512cbf66e0afd9b056230b58f3f1ac698cbe"
    end
    on_intel do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.3.0/termurl-darwin-x64"
      sha256 "159b632b6c396ca1151d43e55052b67687d3af7e5a758109050cf91f3217b00e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.3.0/termurl-linux-arm64"
      sha256 "d58e623770e4c199014dc4fee9cd90c4b017f6f7beecc3541704b5043a1a8e41"
    end
    on_intel do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.3.0/termurl-linux-x64"
      sha256 "5998a9d9abc76866a7ceec85fc482c752e44b97ed3f878b658ab04f194cbf5ca"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "termurl-darwin-arm64" : "termurl-darwin-x64"
    else
      Hardware::CPU.arm? ? "termurl-linux-arm64" : "termurl-linux-x64"
    end
    bin.install binary_name => "termurl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/termurl --version")
  end
end
