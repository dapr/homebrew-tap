# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT100Rc3 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.0.0-rc.3'
  url "https://github.com/dapr/cli/archive/v1.0.0-rc.3.tar.gz"
  sha256 "435f2d9cfaf6eb6ce9cfcffd0b7aeaf9198ecebaad401f98d7b5be4a57515ef0"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.0.0-rc.3"
    cellar :any_skip_relocation
    sha256 catalina: "3b89a889490f984ecc8922135d025691a98956bb741910921f65a7f28c3411bd"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

