# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '0.6.0'
  url "https://github.com/dapr/cli/archive/v0.6.0.tar.gz"
  sha256 "8df5d6e852397481377b10a7c5062c187c191678a0c254a98ccc5c71200c73a7"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end
