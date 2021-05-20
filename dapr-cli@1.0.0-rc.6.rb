# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT100Rc6 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.0.0-rc.6'
  url "https://github.com/dapr/cli/archive/v1.0.0-rc.6.tar.gz"
  sha256 "f77622c1d15af4e29ab96f555f98e0ebee1eb5535fd8f3c35e62a1f727026dc1"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.0.0-rc.6"
    cellar :any_skip_relocation
    sha256 catalina: "31e2c91b132fb132518504ddaa097d3fcc47e319abc2642d66e3144f121563bc"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

