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

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.4.0-rc.2"
    sha256 cellar: :any_skip_relocation, catalina: "1fc503d813a3ede5d3f5586f267cd284ba4061a535fd917ec77cc675f076cd86"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

