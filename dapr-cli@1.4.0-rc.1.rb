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

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.4.0-rc.1"
    sha256 cellar: :any_skip_relocation, catalina: "3b06e38e51ab53396763eb31d1886c73b3125e2b554e4af5a9f55522ffad15eb"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

