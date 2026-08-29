class Masaqhud < Formula
  desc "Lightweight, scriptable desktop HUD for macOS"
  homepage "https://github.com/iflavin/MasaqHUD"
  url "https://github.com/iflavin/MasaqHUD/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "d4712c805306d2637eadfc53312e0017e733476be7341fda3a1c78947ae40605"
  license "Apache-2.0"

  # MasaqHUD 0.6.0 raised its minimum to macOS 14.0; Package.swift targets .macOS(.v14).
  depends_on macos: :sonoma

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/MasaqHUD" => "masaqhud"
  end

  def caveats
    <<~EOS
      To get started:
        masaqhud init
        masaqhud start

      Configuration: ~/.config/masaqhud/masaqhud.js
      Documentation: https://github.com/iflavin/MasaqHUD/blob/main/docs/USER_GUIDE.md
    EOS
  end

  test do
    assert_match "MasaqHUD", shell_output("#{bin}/masaqhud --version")
  end
end
