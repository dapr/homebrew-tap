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

class DaprCliAT1180Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.18.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.18.0-rc.1.tar.gz"
  sha256 "7b9336149e95a4c93b35af5ef675aa9eb17bb16b409e073155b6ab9f77b3ee60"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.18.0-rc.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d848e344689cc10732f29fac7c2592dddddfb157acf0977e7cdb88b05f26e528"
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

