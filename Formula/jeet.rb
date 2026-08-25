# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.3.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.3.0/jeet-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "f45424a35184a6ae8f8b21ba3e856cea1c4187a6e1142e080224f51fe6604198"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.3.0/jeet-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "66d7cfdfb3054053b79e69cfc955f3f039cefb402a170335dd1810fc253f9a78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.3.0/jeet-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b876e6c0338406c83a87f2c1fbd429ef7ec84064fce95e9316cbd24d279bd8d"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.3.0/jeet-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b5f9b5e6dc6e463d4a4112835f87bae4aaad706f7e995792f06a470bf9db767"
    end
  end

  depends_on "git"

  def install
    bin.install "jeet"
    generate_completions_from_executable(bin/"jeet", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jeet --version")
  end
end
