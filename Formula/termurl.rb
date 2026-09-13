class Termurl < Formula
  desc "Terminal client for Hurl collections with an agent-friendly headless CLI"
  homepage "https://github.com/msegoviadev/termurl"
  version "0.4.0"
  license "MIT"
  depends_on "hurl"

  on_macos do
    on_arm do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.4.0/termurl-darwin-arm64"
      sha256 "28f3d7ea5b24bd4dbdc301a2a7647c8dee9baebf4092192d84793811b065afa5"
    end
    on_intel do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.4.0/termurl-darwin-x64"
      sha256 "31af495335a87a717b1d392fb6525a65953dc503017dd33d494c106543a2fa02"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.4.0/termurl-linux-arm64"
      sha256 "b09424d54fcaf24b2f9bebd4b1fa8bd8d275e657021741164d5e351b01538fec"
    end
    on_intel do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.4.0/termurl-linux-x64"
      sha256 "8d503c23d3d27491c210acee8781e85ed0d82b3f14ed456244aa56d8d7591ea2"
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
