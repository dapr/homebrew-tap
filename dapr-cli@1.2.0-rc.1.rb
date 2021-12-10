# ------------------------------------------------------------
# Copyright 2021 The Dapr Authors
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------

class DaprCliAT120Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.2.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.2.0-rc.1.tar.gz"
  sha256 "2fc8893b2fc5cc835950c0a2bbb55a47e00638109e546e5bfc1626d50b6e8e60"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.2.0-rc.1"
    sha256 cellar: :any_skip_relocation, catalina: "82729d8236ead555862e2934fdc995c62a2187cdd72133969221c2e6183c509b"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

