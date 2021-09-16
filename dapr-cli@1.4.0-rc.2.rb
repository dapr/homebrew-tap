# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT140Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.4.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.4.0-rc.2.tar.gz"
  sha256 "0d876a70de55032895aff4caa9fb2b00e26dae119c6c4c79ebff7d5352081198"

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install "dist/darwin_amd64/release/dapr" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

