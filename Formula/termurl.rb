class Termurl < Formula
  desc "Terminal client for Hurl collections with an agent-friendly headless CLI"
  homepage "https://github.com/msegoviadev/termurl"
  version "0.6.0"
  license "MIT"
  depends_on "hurl"

  on_macos do
    on_arm do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.6.0/termurl-darwin-arm64"
      sha256 "d488f618448f512c4c9a99cea49542917f12f9acf4d65a5e8a76e674936c4992"
    end
    on_intel do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.6.0/termurl-darwin-x64"
      sha256 "49ada28af90f3e6af7c41f2a941df7878bca97df6ce56293a9d34f065e126c27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.6.0/termurl-linux-arm64"
      sha256 "f5cede9e9e4d595553564e7ef839a7a6fa8798f1d28031af5975d17142b4c5c4"
    end
    on_intel do
      url "https://github.com/msegoviadev/termurl/releases/download/v0.6.0/termurl-linux-x64"
      sha256 "185f48ded1c1dd75a0c40cda582c85dddce84deb95722a4ec3bfb92922a7772e"
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
