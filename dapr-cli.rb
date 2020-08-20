# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '0.10.0'
  url "https://github.com/dapr/cli/archive/v0.10.0.tar.gz"
  sha256 "79595592bb88d102efaab1c5c57a13df5ad29aa9dcec13e1a94f3212683ee9cb"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v0.10.0"
    cellar :any_skip_relocation
    sha256 "1a9ac628d27bea8c58b3a3e96cf84e5df587047113a02f5df343fc24da4efd9e" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

