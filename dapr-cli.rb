# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.5.0'
  url "https://github.com/dapr/cli/archive/v1.5.0.tar.gz"
  sha256 "3c7d82fa071337e1ce0adc2257d47a0fd39895c6f8ae42519688ead0e73b7683"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.5.0"
    sha256 cellar: :any_skip_relocation, big_sur: "266d184344283dc7ffdf2dc62db469ce94c0c3cd2c94c5ddc17dc3ee081f7b4d"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

