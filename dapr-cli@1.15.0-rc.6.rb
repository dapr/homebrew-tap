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

class DaprCliAT1150Rc6 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.15.0-rc.6'
  url "https://github.com/dapr/cli/archive/v1.15.0-rc.6.tar.gz"
  sha256 "f0f4ca9dc1c5f406b08c6f372bfbafab0e054f1e63a6115e477b053ca96e2b95"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.15.0-rc.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8eabf76c1fd91762ab69a3c984c1e1f7836d40a5eb4dbc44485cdab0295257c2"
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

