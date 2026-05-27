# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.2.5"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.5/jeet-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "3567dcac51c66241424ec5886fe85611c6d7c859bbee5e778b6872b89877a326"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.5/jeet-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "9a4b762772ba1ceca3e9b678915c04c74ab95d5f82dc80f29006336ae62c8304"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.5/jeet-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "05c9ecf832f0bc6f21a8038a1f4cd5b0e2ac5e2139325c3db4f049e4c65c3c19"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.5/jeet-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85aaff477b7d420f8415d7ff6eb40100cb70fe0452b83f1778db031fdda0d9a7"
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
