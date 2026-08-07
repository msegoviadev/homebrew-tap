class Termurl < Formula
  desc "Terminal client for Hurl collections with an agent-friendly headless CLI"
  homepage "https://github.com/msegoviadev/termurl"
  version "0.1.0"
  license "MIT"
  depends_on "hurl"

  on_macos do
    on_arm do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.1.0/termurl-darwin-arm64"
      sha256 "93d16dd298793622efcadfd3252651178069112068396fd1888248321a677bb0"
    end
    on_intel do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.1.0/termurl-darwin-x64"
      sha256 "df6f8f817abe300a650db2534c96b2b45e2d1026472b0770623c593ab4dd3312"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.1.0/termurl-linux-arm64"
      sha256 "912f6c58065fdf35b9c8421b19ccc56a27deb3e9d6af3d57de0c815f1dd85b05"
    end
    on_intel do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.1.0/termurl-linux-x64"
      sha256 "ad4ce461b65478b7ae669bb4796083a5cc8e492cadc5e98f23ffa1c1353e0ff9"
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
