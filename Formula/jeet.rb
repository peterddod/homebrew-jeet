# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.7.1"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.7.1/jeet-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "719c2722a0f9810e9e230253d23ade099d7ae21cd8e2d916725cc77101949972"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.7.1/jeet-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "6668b95a4b69de80f12850d96346a2c7ec669e1edd026b13502b54a9706285ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.7.1/jeet-v0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c0675c370e5e481903784245e8ea29aab3ef60b1201480732f5ac4d0803aa33"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.7.1/jeet-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7447c8f0338a9909052dc763f9b399924cf62610e8a62fb3c33cc663e713355"
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
