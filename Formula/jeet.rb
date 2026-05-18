# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.1.1"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.1.1/jeet-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "4258b5140a307bea530957ad2d59272b624703ce84e5e2e231a2a5c7baba5d82"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.1.1/jeet-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "6d220da684c759202b0e8645dff990bc4d92cbd5422e9413f5cd10152566a74f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.1.1/jeet-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb66bbed6614faf22f3e920380aded969919b2bb7c0b925456d372e9a2ef356e"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.1.1/jeet-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b916f9f77f3d97a02fc2c6128b8244bd02a57775811813d66b65ce5d50c0712e"
    end
  end

  depends_on "git"

  def install
    bin.install "jeet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jeet --version")
  end
end
