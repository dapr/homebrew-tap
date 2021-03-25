# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT110Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.1.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.1.0-rc.1.tar.gz"
  sha256 "2f19405f13da20f0b0e466ee47885e6cc51cb6a1a7c48de0e779614f98ce186b"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.1.0-rc.1"
    cellar :any_skip_relocation
    sha256 "f82db5d04edc9a61a2d10d82fdbc8b5231bb36441c4661469b062f4d9fd47403" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

