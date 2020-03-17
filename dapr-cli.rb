# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '0.6.0-rc.0'
  url "https://github.com/dapr/cli/archive/v0.6.0-rc.0.tar.gz"
  sha256 "0325902d3f5f08dabe61dfe8fe27469b901d8627947d2ef46902fbcfcb18a267"

  depends_on "go" => :build

  bottle do
    root_url "https://dl.bintray.com/dapr/bottles-dapr"
    cellar :any_skip_relocation
    sha256 "75fa06dedb6a00896ddf4458e46685ab16d292dc492ea834ef106349ed15e1e2" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end
