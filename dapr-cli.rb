# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '0.9.0'
  url "https://github.com/dapr/cli/archive/v0.9.0.tar.gz"
  sha256 "91955867387f2004374027d9302a75746d67334f59cbc5f17c87ee52d71f27fe"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v0.9.0"
    cellar :any_skip_relocation
    sha256 "1040f244c191f71b843226708a532d980deacc2777a32d6951139046a11f78fa" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

