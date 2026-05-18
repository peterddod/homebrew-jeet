# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.2.4"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.4/jeet-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "30ffd1a9ed61b3a4172e619fa4875060df5c73d93f6d8415cb3c816e21302dea"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.4/jeet-v0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "ceeafe3489047729c4ab0384678bfbc953faea0356e7f320e48bdf2d44bd6b41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.4/jeet-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "451fb309ac2fa4e9c39528a00b18614df7fcca2baebd00178e55c747403b6f62"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.4/jeet-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1da270c73a98dd90e1d73028db9f4fab60246482be2ad5bc7543d4ddbd74245"
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
