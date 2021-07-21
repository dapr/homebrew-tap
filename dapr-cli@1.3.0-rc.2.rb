# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT130Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.3.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.3.0-rc.2.tar.gz"
  sha256 "7d1f3e8e8f51753c09acd19657595cd22b2a40d87be84e1308ca540a8592687c"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.3.0-rc.2"
    sha256 cellar: :any_skip_relocation, catalina: "c12f022bfabc7d17ac58c45bafc9e9756a1e0551d5af7e301ae31ff5712442db"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

