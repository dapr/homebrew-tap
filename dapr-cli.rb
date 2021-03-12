# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.0.1'
  url "https://github.com/dapr/cli/archive/v1.0.1.tar.gz"
  sha256 "e6688faf5af3059ec62cc49918c9d0b9868e4147227f27d9f52e38bedda7a2ff"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.0.1"
    cellar :any_skip_relocation
    sha256 "ed5c2793065a85da1a1b19d8534aab1f7e16c40d96e229b97d934eb20e504df8" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

