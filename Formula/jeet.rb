# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  url "https://github.com/peterddod/jeet/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "00036092c5597205276cbcf563e55808a0338017511c84de636edd9e566c6777"
  license "MIT"

  depends_on "rust" => :build
  depends_on "git"

  def install
    system "cargo", "install", "--locked", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jeet --version")
  end
end
