# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.4.0'
  url "https://github.com/dapr/cli/archive/v1.4.0.tar.gz"
  sha256 "a6ef9df946d6aebc280c6eeb7b2c4dd78738f726e1da037a4cf160fe16541065"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.4.0"
    sha256 cellar: :any_skip_relocation, catalina: "4f7e4105ba56b079c1b3a83960da9cd4d26979034dbf2c9de5466a5853f2cb9b"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install "dist/darwin_amd64/release/dapr" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

