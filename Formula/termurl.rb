class Termurl < Formula
  desc "Terminal client for Hurl collections with an agent-friendly headless CLI"
  homepage "https://github.com/msegoviadev/termurl"
  version "0.2.0"
  license "MIT"
  depends_on "hurl"

  on_macos do
    on_arm do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.2.0/termurl-darwin-arm64"
      sha256 "a4659e4963a268d22c59288d8e1d2567ff13fb11ac361b948212ac89c5ad721e"
    end
    on_intel do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.2.0/termurl-darwin-x64"
      sha256 "27c66ab01d1343b337a63d0c1c0a66a92053dff0b97ee39b05a0d60a53690bdf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.2.0/termurl-linux-arm64"
      sha256 "e86c3ac1f78d374d4cbd5e61906d4ac3692f7d395f4652aa789d769e32b54896"
    end
    on_intel do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.2.0/termurl-linux-x64"
      sha256 "9304070c3847fbfb20c664bde33c195eac82a18b66f4725741f692c24172d97b"
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
