# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.3.0'
  url "https://github.com/dapr/cli/archive/v1.3.0.tar.gz"
  sha256 "e12e8824714ad4adb67790689f8d299f8ec68f53acf69ff0f88d986c0fb509cc"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.3.0"
    sha256 cellar: :any_skip_relocation, catalina: "e0180d89af41dd591ff9ff2ed8d2ef8f5e664bd665ea7a690961bf279e6065d9"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

