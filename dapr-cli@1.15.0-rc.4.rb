# ------------------------------------------------------------
# Copyright 2025 The Dapr Authors
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

class DaprCliAT1150Rc4 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.15.0-rc.4'
  url "https://github.com/dapr/cli/archive/v1.15.0-rc.4.tar.gz"
  sha256 "3b6cea0b518c75e3983527c8197920d0fff804780342ef8595721ea89e9c537b"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.15.0-rc.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "978d9962d1afce978c506116c41721b526e00fb99012ae6939c0f7b824559f75"
  end

  def install
    with_env(
     "GOPROXY" => ENV["HOMEBREW_GOPROXY"] ? ENV["HOMEBREW_GOPROXY"] : ENV["GOPROXY"],
    ) do
      system "make", "REL_VERSION=#{version}"
    end
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

