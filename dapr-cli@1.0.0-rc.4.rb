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
    sha256 cellar: :any_skip_relocation, catalina: "4921aa243825fed40ac38c260aa3ecb7c499d96c74c5288b676002398d16dbd2"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

