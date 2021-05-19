# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT120Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.2.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.2.0-rc.2.tar.gz"
  sha256 "657dd12b8b00d86c4f1c1f175a0a151143210c355298a5163ebd0f3dcab6dcc8"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.2.0-rc.2"
    cellar :any_skip_relocation
    sha256 "877ab7265ee4501c279896733c35fb93ce60c3518635fb3d50a849a083da11b7" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

