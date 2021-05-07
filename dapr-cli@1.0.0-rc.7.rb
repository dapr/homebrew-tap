# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT100Rc7 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.0.0-rc.7'
  url "https://github.com/dapr/cli/archive/v1.0.0-rc.7.tar.gz"
  sha256 "161d3e3087c9b2956f2dc4925af1d0447c44bdace8876289747cf84777e192c4"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.0.0-rc.7"
    cellar :any_skip_relocation
    sha256 catalina: "6479bd3f3fa69f03a7dbf1817ba9b559dd1e15d0d509f3c20536fc0d80ce2ede"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

