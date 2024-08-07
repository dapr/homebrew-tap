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

class DaprCliAT1140Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.14.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.14.0-rc.1.tar.gz"
  sha256 "39448838679e24c2ed14485f593a665bfadc9f89aad01cdc8866b6d57fdec538"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.14.0-rc.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d5d49c437bc2c382b2d24a6ac63d05fa76359b72b4f2198b833fb850a888e616"
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

