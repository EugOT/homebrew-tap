class Gitstore < Formula
  desc "Separate .git and .jj databases from working trees for cloud-synced folders"
  homepage "https://github.com/EugOT/gitstore-cli"
  license "MIT"
  version "0.2.1"

  url "https://github.com/EugOT/gitstore-cli/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "fa6f9824647f3cbe593a67f7bcb6e428d62a25fe25693065913e3ee5e9dea0fa"

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
