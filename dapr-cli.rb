# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '0.8.0'
  url "https://github.com/dapr/cli/archive/v0.8.0.tar.gz"
  sha256 "2688988e6d17192b34c7426544bfd242695ad7178a241130767b9b79388e052e"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v0.8.0"
    cellar :any_skip_relocation
    sha256 "c9766867b63b8aeffe9021eb78ab0be22cf105dc075169131eb73017aa43674d" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

