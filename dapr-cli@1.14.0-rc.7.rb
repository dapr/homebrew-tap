# ------------------------------------------------------------
# Copyright 2024 The Dapr Authors
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

class DaprCliAT1140Rc7 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.14.0-rc.7'
  url "https://github.com/dapr/cli/archive/v1.14.0-rc.7.tar.gz"
  sha256 "4368fe2d4b1e47659b7173ac3cf5eed67c6048760ed5e53ca94b3b08668b10a9"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.14.0-rc.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a92fbf94bb4eb972ea8e9c6dbce2ca414698a8fc341f1269c598ca2386cfbd34"
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

