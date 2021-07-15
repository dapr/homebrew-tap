# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.2.0'
  url "https://github.com/dapr/cli/archive/v1.2.0.tar.gz"
  sha256 "a4d4d6a691d6f5306123e937e3532cfafe2b6b48674c1ee1f4965800920cb4c5"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.2.0"
    sha256 cellar: :any_skip_relocation, catalina: "e59f32f0b96a6fbd8890082195aa85913efc190e4077705d0c04f876ab617dcc"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

