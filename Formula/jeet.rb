# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.11.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.11.0/jeet-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "95ff6aad5daa23428f819b9dd7d8f17199ec13b2784c627a5c8752ea4a4cfb00"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.11.0/jeet-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "233b676172d967a5e883d975acd0c5ad52b48f4d99f7eac6f2c2f9b0e978347a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.11.0/jeet-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d60e4588c27a79c408ba185b0cda1debdf6c72b7960c1a5ee71d98fa6f7bee34"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.11.0/jeet-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82c948b84b56b0bc6740a7519bf4a06344b82825552c8e80082f0ca53139c907"
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
