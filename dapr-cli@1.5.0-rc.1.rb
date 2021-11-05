# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT150Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.5.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.5.0-rc.1.tar.gz"
  sha256 "66ad561e8e84f600704efca7c1d80c2c6003c723fe4433672307d4a4f1f11f3a"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.5.0-rc.1"
    sha256 cellar: :any_skip_relocation, big_sur: "db7a3e3836d6c2e2f1bd1248353cb3ed9c3c7921c3736fd877939e4072fe83bf"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install "dist/darwin_amd64/release/dapr" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

