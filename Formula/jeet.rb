# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.7.2"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.7.2/jeet-v0.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "8a361f156961418fdf5a4ed0d61549d03d52e59e24950bd98efab53748d3d7d3"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.7.2/jeet-v0.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "53e0ce70a06a4281730be80c4ad5172c7bed84f213b7b4c2a7e3cc4335a85edc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.7.2/jeet-v0.7.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b64905ace45cc7cb3907d7f30066dde5acb4b90fbf6574e300821c73483589b5"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.7.2/jeet-v0.7.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84cd1e57adc4a6cdc2327716bcb7a8537102972fcb6258efecdc4b6d5d38e426"
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
