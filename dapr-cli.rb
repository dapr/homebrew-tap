# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '0.11.0'
  url "https://github.com/dapr/cli/archive/v0.11.0.tar.gz"
  sha256 "53ec1315053edfb2dfffb6dffb982a1ab90fd807f774631b3df8feff3684ea17"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v0.11.0"
    cellar :any_skip_relocation
    sha256 "6db2f36609f71c21e788c9001728c048240addd598e68b341e311ebf795335c6" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

