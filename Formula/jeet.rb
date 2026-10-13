# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.10.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.10.0/jeet-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "294df949453c6a0455beb67681f50706cc0a8bc4d3f580f773af69fea8d3ac55"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.10.0/jeet-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "326c647f76deec4ca3dfc3ef93e2f0db479f2ae85a304fffb667ef316ca0f8df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.10.0/jeet-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5f5d9d7df5dcf17bacf25369d0fa8b2318ef4d10534195b7df7fea30e0494b0"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.10.0/jeet-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "946e8f3d96af358888d467c2a11058109f0439ec90a4b5c7fe840edbf235b370"
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
