# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.5.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.5.0/jeet-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "ac124108a68469ec9d756a279e86701684fdab67b538910b9fc1efec3f7a049f"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.5.0/jeet-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "ba4d61ab1372e86410451503c55c5359ca5cfb55e31950bc5eba54e0f25c8aef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.5.0/jeet-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91c5a18d8356885817409a71eca28f7a4882fdb3667ee3fd3812b39fe73439ab"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.5.0/jeet-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20f68a41e3a24717551bcd5270d23b8c437a28e622cf0be98a1cfa0753d0e47c"
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
