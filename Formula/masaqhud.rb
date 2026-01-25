class Masaqhud < Formula
  desc "Lightweight, scriptable desktop HUD for macOS"
  homepage "https://github.com/iflavin/MasaqHUD"
  url "https://github.com/iflavin/MasaqHUD/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "6c44b66be1486f8c24c5a44a1260949ccd482d2ea98006b9046f842c3997de16"
  license "Apache-2.0"

  depends_on :macos

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
