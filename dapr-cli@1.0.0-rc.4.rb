# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT100Rc4 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.0.0-rc.4'
  url "https://github.com/dapr/cli/archive/v1.0.0-rc.4.tar.gz"
  sha256 "600869e16d430406c285cd1851697863e2f2ea00cde8a7e83eb8aba61b55f126"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.0.0-rc.4"
    cellar :any_skip_relocation
    sha256 "d8ff5d32b7d54353ea848a526318b301cf2110888108a2353c8fecb17fa342b9" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

