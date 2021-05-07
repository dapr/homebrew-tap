# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT100Rc5 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.0.0-rc.5'
  url "https://github.com/dapr/cli/archive/v1.0.0-rc.5.tar.gz"
  sha256 "8b0bb2a0a9c49b720563c28b477803ff06547d6d3dd105d5c5801ad1377207e8"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.0.0-rc.5"
    cellar :any_skip_relocation
    sha256 catalina:"8d7b70d4335ed6718ec6156219f7fba1e366a6abc99ecf62860b9e5a37c60a03"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

