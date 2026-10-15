# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.12.4"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.4/jeet-v0.12.4-aarch64-apple-darwin.tar.gz"
      sha256 "19cd4aaaa5ba9ce22184b3abdd6f69f9b51f724d93adfe2471284f49476f603a"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.4/jeet-v0.12.4-x86_64-apple-darwin.tar.gz"
      sha256 "d23354a98de2b4625c3c63e6c623597d357a1ece00008673ee759f6d91c9c95f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.4/jeet-v0.12.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55a1a5f99ac48375b3ad840621f82cd5e74221d136aec4973715087cc5dc7e35"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.4/jeet-v0.12.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b9cc0b5e9c7c6fbb037e627b810f2f9249ebdb3a91c2b995e849550c03133887"
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
