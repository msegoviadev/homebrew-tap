class Termurl < Formula
  desc "Terminal client for Hurl collections with an agent-friendly headless CLI"
  homepage "https://github.com/msegoviadev/termurl"
  version "0.5.0"
  license "MIT"
  depends_on "hurl"

  on_macos do
    on_arm do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.5.0/termurl-darwin-arm64"
      sha256 "70b83e9e06b3dec2f6077e7544968f3c34356372530066c462a28e707fe32e46"
    end
    on_intel do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.5.0/termurl-darwin-x64"
      sha256 "8bb2d25c1065791bef5a13b915a82c0573ffa313693a3dc33bdd52079431412a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.5.0/termurl-linux-arm64"
      sha256 "1f35509e5028cc71f87806141be230f10079c583033e486ff0fdc8819288523e"
    end
    on_intel do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.5.0/termurl-linux-x64"
      sha256 "ca73f046dda370cde37ecc0bfa97fcccd64271ce7fdec3ceb1d8a76e456ac485"
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
