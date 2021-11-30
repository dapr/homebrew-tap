# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT151Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.5.1-rc.1'
  url "https://github.com/dapr/cli/archive/v1.5.1-rc.1.tar.gz"
  sha256 "ff48045be172b29170bfa8ab05a2fba37ebc6bc96e690267ce6457ab52485465"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.5.1-rc.1"
    sha256 cellar: :any_skip_relocation, big_sur: "4f48b4a8d82ce3cd296cc4ca05dce676edb4b3c812ffd3ac37aa899a7855a37e"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

