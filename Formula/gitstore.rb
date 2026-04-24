class Gitstore < Formula
  desc "Separate .git and .jj databases from working trees for cloud-synced folders"
  homepage "https://github.com/EugOT/gitstore-cli"
  license "MIT"
  version "0.2.0"

  url "https://github.com/EugOT/gitstore-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c7b4c0907aa2bd71e06a6905dbe8105af37af82661334d3dfdd3b4044b03f1b1"

  head "https://github.com/EugOT/gitstore-cli.git", branch: "main"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "--prefix", prefix
  end

  test do
    assert_match "Usage: gitstore", shell_output("#{bin}/gitstore --help 2>&1")
    system bin/"gitstore", "init"
  end
end
