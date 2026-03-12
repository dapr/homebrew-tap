# ------------------------------------------------------------
# Copyright 2026 The Dapr Authors
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

class DaprCliAT1171Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.17.1-rc.1'
  url "https://github.com/dapr/cli/archive/v1.17.1-rc.1.tar.gz"
  sha256 "8f659423dd5c2179535064dff0921a3be0361674c37cbe2056ed36a93c86ac12"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.17.1-rc.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e2d8e3419b8b9f9d95f21d22b36e16fecb5e9d6cd177a6283a38a9ede7e6a1a1"
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

