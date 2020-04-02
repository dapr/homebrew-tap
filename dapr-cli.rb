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

  bottle do
    root_url "https://dl.bintray.com/dapr/bottles-dapr"
    cellar :any_skip_relocation
    sha256 "91521d4fabf46ee82fd94e2fedd094f561cc6d22f0d426b07447200d8cebe81e" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end
