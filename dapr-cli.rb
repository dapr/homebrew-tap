# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '0.7.0'
  url "https://github.com/dapr/cli/archive/v0.7.0.tar.gz"
  sha256 "96850bf46a35483416bbb2d96b5cc0bc534986071d90ca759fb76aa30f5846d1"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v0.7.0"
    cellar :any_skip_relocation
    sha256 "73beb5512a880cfa24683e3711ad1bf30a9e4527c02414743c4fc28799dee787" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

