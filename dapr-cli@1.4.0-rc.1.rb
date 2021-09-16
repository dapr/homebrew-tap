# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT140Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.4.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.4.0-rc.1.tar.gz"
  sha256 "7107c40a236b061637c342f10e5b92a0c33dc88c2ac320343de34b04139acb82"

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

