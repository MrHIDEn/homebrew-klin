# typed: false
# frozen_string_literal: true

# Homebrew tap formula for the Klin compiler.
# Repo: https://github.com/MrHIDEn/homebrew-klin
#
#   brew tap dart-lang/dart
#   brew tap mrhiden/klin
#   brew install klin
#
# HEAD (latest main):
#   brew install --HEAD klin
#
# Source of truth also lives in https://github.com/MrHIDEn/klin (Formula/klin.rb).
class Klin < Formula
  desc "Systems language that compiles to C"
  homepage "https://github.com/MrHIDEn/klin"
  license "MIT"
  url "https://github.com/MrHIDEn/klin/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fde0ce144cdbe31b865efc29141e275ec7e0837497a65edeab2de688a9ae1556"
  version "0.1.0"

  head "https://github.com/MrHIDEn/klin.git", branch: "main"

  depends_on "dart-lang/dart/dart" => :build

  def install
    system "dart", "pub", "get"
    system "dart", "compile", "exe", "bin/klin.dart", "-o", "klin"
    bin.install "klin"
    (pkgshare/"stdlib").install Dir["stdlib/*"]
  end

  def caveats
    <<~EOS
      Klin needs a host C compiler (gcc, clang, or tcc) on PATH for `klin run`.

      Stdlib is installed at:
        #{pkgshare}/stdlib
      (`klin` discovers it next to the binary / under share/klin).
    EOS
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/klin --version"))
    (testpath/"hello.kl").write <<~EOS
      fn main() {}
    EOS
    system bin/"klin", "--emit-c", testpath/"hello.kl"
    assert_path_exists testpath/"out/hello.c"
  end
end
