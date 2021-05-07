# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.1.0'
  url "https://github.com/dapr/cli/archive/v1.1.0.tar.gz"
  sha256 "e34389a4491b071bdd915d72adaf2ee8273d0da90b4178a16c88c28ceaba2717"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.1.0"
    cellar :any_skip_relocation
    sha256 catalina: "818bd14f4c8b05ff249444e0e1e7b98ba5183f2342d82481709df687b8573d5d"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

